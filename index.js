const os = require('os');

function helloWorld() {
  console.log(`Hello, world!${os.EOL}`);
}

module.exports = helloWorld;
