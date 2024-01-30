# shadcn/ui starter script for Vite, React, Typescript

## Overview

This script automates the process of setting up a new Vite project with shadcn-ui as described [here](https://ui.shadcn.com/docs/installation/vite). It performs several steps to create and configure the project environment according to best practices and specific needs. 

**NOTE**: This script has only been tested with Vite framework **React** and language **Typescript**. It may not work with other frameworks or languages.

## Prerequisites

Before running this script, ensure that the following requirements are met:

## Example usage
`./setup-shadcn-project.sh my-project`

1. **Node.js and npm**: The script uses Node Package Manager (npm) to install packages. Make sure Node.js and npm are installed on your system. You can download them from [Node.js official website](https://nodejs.org/).

2. **jq**: This script uses `jq` for manipulating JSON data. `jq` must be installed on your system. Installation instructions can be found on the [jq official website](https://stedolan.github.io/jq/download/).

3. **Bash Shell**: This is a Bash script; hence, a Bash shell environment is required to run it.

4. **Unix-like Environment (Linux/macOS)**: The script contains commands specific to Unix-like systems. It is tested on Linux and macOS.

## Steps Performed by the Script

1. **Create Vite Project**: Initializes a new Vite project using the provided project name.

2. **Install Packages**: Installs Tailwind CSS, PostCSS, Autoprefixer, and @types/node for TypeScript support.

3. **Configure TypeScript**: Adds necessary fields to `tsconfig.json`. This step requires `jq` to manipulate the JSON file.

4. **Configure Vite**: Overwrites `vite.config.ts` with a predefined configuration for optimal setup.

5. **Initialize shadcn/ui**: Runs shadcn/ui initialization in the project.
    * **NOTE**: When you get to the step "✔ Where is your global CSS file?", it will most likely be located at `src/index.css`

6. **Install Remaining Packages**: Installs additional packages required for the project.