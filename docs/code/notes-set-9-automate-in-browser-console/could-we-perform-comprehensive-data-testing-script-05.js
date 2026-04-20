const data = {};

const uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
const lowercase = 'abcdefghijklmnopqrstuvwxyz';
const digits = '0123456789';
const special = '*';
const allChars = uppercase + lowercase + digits + special;

function getRandomChar(charSet) {
    return charSet[Math.floor(Math.random() * charSet.length)];
}

function generateTestString() {
    let testString = '';
    const requiredTypes = [uppercase, lowercase, digits, special];

    // Ensure at least one of each required type
    const chars = requiredTypes.map(type => getRandomChar(type));

    // Fill the rest of the string with random characters
    while (chars.length < 7) {
        chars.push(getRandomChar(allChars));
    }

    // Shuffle the characters to make the strings more random
    for (let i = chars.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [chars[i], chars[j]] = [chars[j], chars[i]];
    }

    testString = chars.join('');
    return testString;
}

// Generate a few example strings
data.testStrings = [];
const numberOfStringsToGenerate = 10; // Generate 10 example strings

for(let i = 0; i < numberOfStringsToGenerate; i++) {
    data.testStrings.push(generateTestString());
}

