const data = {};
const validChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789*".split('');
const testStrings = [];
let charsUsed = new Set();
let currentString = '';
const stringLength = 7;

while (charsUsed.size < validChars.length) {
    currentString = '';
    for (let i = 0; i < stringLength; i++) {
        const charIndex = Math.floor(Math.random() * validChars.length);
        const char = validChars[charIndex];
        currentString += char;
        charsUsed.add(char);
    }
    testStrings.push(currentString);
}

data.testStrings = testStrings;

