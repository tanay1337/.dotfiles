-- Suggest installing an LSP server when a filetype has available servers
-- but none of them are installed yet (VS Code-style hint, opt-in via prompt).
local M = {}

-- Remember filetypes we already prompted for this session
local notified = {}

---Checks whether a filetype has an installable server missing.
---@param ft string filetype of the freshly opened buffer
---@return string[] servers available for ft that are not installed (empty if ft is already covered)
local function missing_servers(ft)
	local mlsp = require("mason-lspconfig")

	local candidates = mlsp.get_available_servers({ filetype = ft })
	if #candidates == 0 then
		return {}
	end

	local installed = {}
	for _, server in ipairs(mlsp.get_installed_servers()) do
		installed[server] = true
	end

	-- Already covered by an installed server for this filetype: stay quiet.
	-- The filetype map lists alternatives too (e.g. lua_ls *and* emmylua_ls).
	for _, server in ipairs(candidates) do
		if installed[server] then
			return {}
		end
	end

	-- Nothing installed yet: offer servers that have a real lspconfig
	-- definition (the map also lists helpers without one), without duplicates.
	local seen, missing = {}, {}
	for _, server in ipairs(candidates) do
		if not seen[server] and #vim.api.nvim_get_runtime_file("lsp/" .. server .. ".lua", true) > 0 then
			seen[server] = true
			missing[#missing + 1] = server
		end
	end
	return missing
end

---@param server string lspconfig server name
local function install(server)
	local package = require("mason-lspconfig.mappings").get_mason_map().lspconfig_to_package[server]
	if not package then
		return
	end
	-- mason-lspconfig auto-enables the server on install success,
	-- so it attaches to the open buffer without a restart.
	require("mason.api.command").MasonInstall({ package })
end

function M.setup()
	vim.api.nvim_create_autocmd("FileType", {
		desc = "Suggest LSP servers for this filetype",
		group = vim.api.nvim_create_augroup("LspSuggest", { clear = true }),
		callback = function(event)
			local ft = event.match
			if ft == "" or notified[ft] then
				return
			end

			local ok, missing = pcall(missing_servers, ft)
			if not ok or #missing == 0 then
				return
			end

			-- Mark before prompting so dismissing once doesn't nag on every buffer
			notified[ft] = true

			local mappings = require("mason-lspconfig.mappings")
			vim.ui.select(missing, {
				prompt = ('No LSP installed for "%s". Install one?'):format(ft),
				format_item = function(server)
					local map = mappings.get_mason_map()
					local pkg = map and map.lspconfig_to_package[server]
					if pkg then
						return ("%s  —  :MasonInstall %s"):format(server, pkg)
					end
					return server
				end,
			}, function(choice)
				if choice then
					install(choice)
				end
			end)
		end,
	})
end

return M
