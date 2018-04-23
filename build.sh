rm -rf dist/

# Build individual classes
classes=(class1.md class2.md)
for filename in "${classes[@]}"; do
  ./node_modules/.bin/reveal-md "$filename" --static dist/
  basename=$(basename "$filename" .md)
  mv dist/index.html dist/$basename.html
done
# Build the index file last
./node_modules/.bin/reveal-md index.md --static dist/
cp -r static/ dist/static/
