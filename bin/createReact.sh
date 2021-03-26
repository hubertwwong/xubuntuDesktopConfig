#!/bin/bash
if [ $# -eq 0 ]
  then
    echo "usage: createReact.sh app_name"
fi

# Bash scripts that calls create react app
# Does some deleting and modifications to make it a more minimal start point

npx create-react-app $1
cd $1/src

echo "Deleting unused files."
rm logo.svg
rm *.css
rm App.test.js
rm App.js

echo "Creating components directory"
mkdir components

echo "Creating a minimal App.js"

text="function App() {
  return (
    <div className=\"App\">
      hello
    </div>
  );
}

export default App;" 
echo "$text" > App.js

echo "Delete the css import. Using sed. -i to update."
sed -i '/css/d' index.js