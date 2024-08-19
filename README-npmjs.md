# Publishing and Consuming Your First Private NPMJS Package

1. Clone the repository:

    ```sh
    git clone https://github.com/dzivkovi/hello-world-package
    ```

2. Validate `.npmrc` and set `NPM_TOKEN`:
   - Find the token at: https://www.npmjs.com/settings/<your-username>/tokens
   - Set the token in your environment:

    ```sh
    export NPM_TOKEN=<your-npm-token>
    npm whoami  # should return your <your-username> in https://www.npmjs.com/
    ```

3. Run unit tests:

    ```sh
    npm install --save-dev mocha
    npm test
    ```

4. Execute the production build:

    ```sh
    rm -rf node_modules package-lock.json
    npm cache clean --force
    npm install --omit=dev
    ```

5. Publish the package:

    ```sh
    npm publish
    ```

   - If it fails, increment the package version in [`package.json`](./package.json) and try again.

6. Test client:

   - Install the package:

     ```sh
     cd client
     npm install
     node client.js
     ```

## Troubleshooting

### Clear Cache and Reinstall

- Ensure the package version in the client matches the one published on the NPMJS server:

  ```sh
  rm -rf node_modules package-lock.json
  npm cache clean --force
  npm install
  ```

### npm Unpublish Policy

- For newly created packages, as long as no other packages in the npm Public Registry depend on your package, you can unpublish anytime within the first 72 hours after publishing.
- For more information, refer to the [npm unpublish policy](https://docs.npmjs.com/policies/unpublish).

## Notes

- Replace `<your-username>` and `<your-organization>` with your assigned npmjs username and organization name.
- When writing and reading `NPM_TOKEN`, clients need only a token with permission to read (not write).
- Proper tokens can be found at: https://www.npmjs.com/settings/<your-username>/tokens
