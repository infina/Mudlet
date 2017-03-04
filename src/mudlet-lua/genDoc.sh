
# wipe all old html files
cd mudlet-lua-doc/
find . -name "*.html" -type f

# generate documentation
cd ../lua/
ldoc --style `pwd` --project Geyser --not_luadoc --dir ../mudlet-lua-doc geyser/

# maintain compatibility with old luadoc-generated links. 
# luadoc created geyser/, ldoc makes modules/
cd ../mudlet-lua-doc
find . -type f -exec sed -i 's@modules/@geyser/@g' {} +
mv modules geyser

