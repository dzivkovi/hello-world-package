# Publishing Your First NPM Package to a Private GitHub Repository

## Create a "Hello World" Package

### Step 1: Create a Private GitHub Repository

- Log in to GitHub.
- Create a new repository (e.g. `hello-world-package`).
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

### Step 3: Configure NPM for GitHub Packages

1. **Create `.npmrc`**: Add the following to your project's `.npmrc` file:

   ```bash
   @c_dzivkovic:registry=https://npm.pkg.github.com
   //npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}
   ```

   - Replace `c_dzivkovic` with your GitHub username.
   - Set your GitHub PAT as an environment variable:

    ```bash
    export GITHUB_TOKEN=ghp_YourGitHubToken
    ```

2. **Log in to GitHub Packages**: Use the following command to authenticate with GitHub Packages:

   ```bash
   npm login --registry=https://npm.pkg.github.com
   ```

   - You will be prompted for your GitHub username, email, and a Personal Access Token (PAT) that you previously generated with `write:packages` and `read:packages` scopes.

3. **Publish to GitHub Packages**: Run the following command to publish your package:

   ```bash
   npm publish
   ```

### Step 4: Create Unit Tests

1. **Install Mocha**:

   ```bash
   npm install --save-dev mocha
   ```

2. **Create Test File**: Add `test/index.test.js` with the following content:

   ```javascript
   const os = require('os');
   const assert = require('assert');
   const helloWorld = require('../index');

   describe('HelloWorld Function', function () {
     it('should print "Hello, world!"', function () {
       let output = '';
       const storeLog = inputs => (output += inputs);
       console.log = storeLog;

       helloWorld();

       assert.strictEqual(output, `Hello, world!${os.EOL}`);
     });
   });
   ```

3. **Update `package.json`**: Add a test script in the `scripts` section:

   ```json
   "scripts": {
     "test": "mocha"
   }
   ```

4. **Testing**: Run unit tests in the main project:

   ```bash
   npm test
   ```

## Consume a "Hello World" Package

1. **Create Client Subfolder**:

   ```bash
   mkdir client
   cd client
   ```

2. **Initialize NPM Project**:

   ```bash
   npm init -y
   ```

3. **Configure `.npmrc` for Client**: Add the same `.npmrc` configuration with your GitHub PAT:

   ```bash
   @c_dzivkovic:registry=https://npm.pkg.github.com
   //npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}
   ```

4. **Install Package**:

   ```bash
   npm install @c_dzivkovic/hello-world-package
   ```

5. **Create Client File**:

   ```javascript
   const helloWorld = require('@c_dzivkovic/hello-world-package');
   helloWorld();
   ```

6. **Run the client file in the `client` subfolder**:

   ```bash
   node client.js
   ```
