npm install typescript --save-dev
npm install eslint
npm install svelte@latest
npm install -D tailwindcss@latest
npm install -D tailwindcss@latest postcss autoprefixer vite
npm install -D postcss-import
npm install -D postcss-nesting
npm install -D daisyui@latest
npm install firebase
npm install -g firebase-tools
npm install

npm create svelte@latest
npm tailwindcss init
npx tailwindcss init -p

npm run dev -- --open
npx tailwindcss -i ./src/input.css -o ./src/output.css --watch
 