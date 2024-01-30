#!/bin/bash

# Check if an argument is provided
if [ $# -eq 0 ]; then
    echo "No project name provided. Usage: ./setup.sh <project_name>"
    exit 1
fi

# The first argument is the project name
PROJECT_NAME=$1

# Step 1
echo "Creating new Vite project"
# Creating a new Vite project with the provided name
npm create vite@latest "$PROJECT_NAME"

# Navigate into the project directory
cd "$PROJECT_NAME"

# Step 2
echo "Installing necessary packages for shadcn/ui"
# Installing Tailwind CSS, PostCSS, Autoprefixer and @types/node
npm install -D tailwindcss postcss autoprefixer @types/node

# Initializing Tailwind CSS with PostCSS
npx tailwindcss init -p

# Step 3
echo "Adding fields to tsconfig.json. Make sure jq is installed for this step to work"
# Check if tsconfig.json exists
if [ -f "tsconfig.json" ]; then
    # Remove comments from tsconfig.json
    sed -i '' '/\/\*/,/\*\//d' tsconfig.json

    # Modify tsconfig.json using jq
    jq '.compilerOptions += {"baseUrl": ".", "paths": {"@/*": ["./src/*"]}}' tsconfig.json > temp.json && mv temp.json tsconfig.json
else
    echo "tsconfig.json not found. Ensure that this is a TypeScript project."
fi

# Step 4
echo "rewriting vite.config.ts based on shadcn docs"
# Overwrite vite.config.ts with the new configuration
cat <<EOF > vite.config.ts
import path from "path"
import react from "@vitejs/plugin-react"
import { defineConfig } from "vite"

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
})
EOF

# Step 5
echo "Initializing shadcn/ui in your project"
npx shadcn-ui@latest init

# Step 6
echo "Installing the rest of the packages"
npm install

echo "Setup complete! To start your new project:"
echo "cd $PROJECT_NAME"
echo "npm run dev"
