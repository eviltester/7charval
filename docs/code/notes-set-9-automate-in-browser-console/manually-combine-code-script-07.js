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


const characterInput = document.querySelector('input[type="text"]');
const checkButton = document.querySelector('input[type="button"][name="validate"]');
const validationMessage = document.querySelector('input[name="validation_message"]');

if (!characterInput) {
    console.error("Character input not found.");
} else if (!checkButton) {
    console.error("Check button not found.");
} else if (!validationMessage) {
    console.error("Validation message element not found.");
} else {
    for (const str of testStrings) {
        characterInput.value = str;
        checkButton.click();
        // In some cases, you might need a small delay here for asynchronous updates:
        // await new Promise(resolve => setTimeout(resolve, 50));
        const isValid = validationMessage.value === "Valid Value";
        console.log(`Input string: "${str}"`);
        console.log(`Validation message: "${validationMessage.value}"`);
        console.log(`Is Valid: ${isValid}`);
        console.log('---');
    }
}

