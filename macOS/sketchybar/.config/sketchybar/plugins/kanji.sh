# Get the Kanji data
random_file=$(find ~/Documents/kanji -name "*.json" | sort -R | tail -n 1)
kanji_data=$(cat $random_file)

# Use jq (needs to be installed to parse json data)
character=$(echo $kanji_data | jq -r ".kanji")
echo $character

meaning=$(echo $kanji_data | jq -r ".meanings")
echo $meaning

kunyomi=$(echo $kanji_data | jq -r ".kunyomi")
echo $kunyomi

onyomi=$(echo $kanji_data | jq -r ".onyomi")
echo $onyomi

sketchybar --set "$NAME" icon="􀫕" label=$character

sketchybar --default background.padding_left=5 \
                     background.padding_right=5 \
                     icon.font="SF Symbols:Bold:14.0" \
                     label.font="SF Pro:Normal:13.0" \
           --add item meaning popup.kanji \
           --set meaning label="$meaning" \
           --add item kunyomi popup.kanji \
           --set kunyomi label="$kunyomi" \
           --add item onyomi popup.kanji \
           --set onyomi label="$onyomi"
