# Select a random number between 1 and 80 (inclusive)
random_number=$(jot -r 1 1 80)

# Get the Kanji data
kanji_data=$(curl -s http://ec2-13-60-36-124.eu-north-1.compute.amazonaws.com/api/v1/kanji/$random_number)
echo $kanji_data

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
                     icon.padding_right=5 \
                     icon.font="SF Symbols:Bold:14.0" \
                     label.font="SF Pro:Normal:13.0" \
           --add item meaning popup.kanji \
           --set meaning icon="􀛭" label="$meaning" \
           --add item kunyomi popup.kanji \
           --set kunyomi icon="􁓕" label="$kunyomi" \
           --add item onyomi popup.kanji \
           --set onyomi icon="􀤍" label="$onyomi"
