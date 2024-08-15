# Publishing Your First NPM Package to a Private GitHub Repository

## "Hello World" Instructions

### Step 1: Create a Private GitHub Repository

- Log in to GitHub.
- Create a new repository by clicking the "+" icon in the top-right corner and selecting "New repository."
- Name your repository (e.g., `hello-world-package`).
- Set the repository to **Private**.
- Click "Create repository."

### Step 2: Initialize Git in Your Project

- In your local project directory, run the following commands:

  ```bash
  git init
  git remote add origin https://github.com/dzivkovi/hello-world-package.git
  git add .
  git commit -m "Initial commit"
  git push -u origin master
  ```

### Step 3: Publish Your Package to GitHub Packages

1. Create a `.npmrc` file in your project directory with the following content:

   ```bash
   @dzivkovi:registry=https://npm.pkg.github.com
   //npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}
   ```

   - Replace `dzivkovi` with your GitHub username.
   - Generate a Personal Access Token (PAT) from your GitHub account with the `write:packages` and `read:packages` scopes.
   - Paste your PAT into the environment variable `GITHUB_TOKEN`:

    ```bash
    export GITHUB_TOKEN=ghp_YourGitHubToken
    ```

2. Publish your package to GitHub Packages:

   ```bash
   npm publish
   ```

## Turn `main.js` into a Unit Test

To keep your distribution clean and avoid including standalone test programs, we can transform your `main.js` into a unit test using a testing framework like Mocha. Here's how you can do that:

### Step 1: Install Mocha

- Install Mocha as a development dependency:

  ```bash
  npm install --save-dev mocha
  ```

### Step 2: Create a Test File

- Create a `test` folder in your project directory and move the contents of `main.js` into a new test file called `index.test.js`:

  ```javascript
  const assert = require('assert');
  const helloWorld = require('../index');

  describe('HelloWorld Function', function () {
    it('should print "Hello, world!"', function () {
      // Capture console output
      let output = '';
      const storeLog = inputs => (output += inputs);
      console.log = storeLog;

      helloWorld();
      
      assert.strictEqual(output, 'Hello, world!\n');
    });
  });
  ```

### Step 3: Update `package.json`

- Update the `scripts` section of your `package.json` to include the test command:

  ```json
  "scripts": {
    "test": "mocha"
  }
  ```

## 3. Create a Client File in a Separate Folder to Consume the Remote Package

Now let's create a client project that will consume your published package from the remote GitHub repository.

### Step 1: Create a New Directory for the Client

- Create a new directory for your client project:

  ```bash
  mkdir hello-world-client
  cd hello-world-client
  ```

### Step 2: Initialize the Client Project

- Initialize the NPM project:

  ```bash
  npm init -y
  ```

### Step 3: Configure `.npmrc` for GitHub Packages

- Create a `.npmrc` file in your client project directory with the following content:

  ```bash
  @dzivkovi:registry=https://npm.pkg.github.com
  //npm.pkg.github.com/:_authToken=YOUR_GITHUB_TOKEN
  ```

  - Replace `dzivkovi` with your GitHub username.
  - Use the same personal access token as earlier.

### Step 4: Install the Remote Package

- Install your package from GitHub Packages:

  ```bash
  npm install @dzivkovi/hello-world-package
  ```

### Step 5: Create a Client File

- Create a `client.js` file and use the installed package:

  ```javascript
  const helloWorld = require('@dzivkovi/hello-world-package');

  helloWorld();
  ```

## Final Steps: Testing and Usage

- In your main project, run the tests using:
  ```bash
  npm test
  ```

- In your client project, execute the `client.js` file:

  ```bash
  node client.js
  ```

