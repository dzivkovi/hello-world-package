const os = require('os');
const assert = require('assert');
const helloWorld = require('../index');

describe('HelloWorld Function', function () {
  it('should print "Hello, world!"', function () {
    // Capture console output
    let output = '';
    const storeLog = inputs => (output += inputs);
    console.log = storeLog;

    helloWorld();

    assert.strictEqual(output, `Hello, world!${os.EOL}`);
  });
});
