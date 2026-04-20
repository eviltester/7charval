const data = {};
const characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789*";
const stringLength = 7;
data.testStrings = [];
const usedCharacters = new Set();

// Generate initial strings ensuring each character is used at least once
for (const char of characters) {
    let baseString = '';
    for (let i = 0; i < stringLength - 1; i++) {
        // Fill with random characters, leaving one spot for the required character
        const randomIndex = Math.floor(Math.random() * characters.length);
        baseString += characters[randomIndex];
    }
    // Insert the required character at a random position
    const insertIndex = Math.floor(Math.random() * stringLength);
    const testString = baseString.slice(0, insertIndex) + char + baseString.slice(insertIndex);
    data.testStrings.push(testString);
    usedCharacters.add(char);
}

// Generate additional random strings if needed, until we have a reasonable number or cover more cases
const additionalStringsToGenerate = 50; // Generate some more random strings
for (let i = 0; i < additionalStringsToGenerate; i++) {
    let randomString = '';
    for (let j = 0; j < stringLength; j++) {
        const randomIndex = Math.floor(Math.random() * characters.length);
        randomString += characters[randomIndex];
    }
    data.testStrings.push(randomString);
}

// Shuffle the test strings to avoid potential ordering issues
data.testStrings.sort(() => Math.random() - 0.5);


data.results = [];

const characterInput = document.querySelector('input[type="text"]');
const checkButton = document.querySelector('input[type="button"][name="validate"]');
const validationMessage = document.querySelector('input[name="validation_message"]');

if (!characterInput) {
    data.error = "Character input not found.";
} else if (!checkButton) {
    data.error = "Check button not found.";
} else if (!validationMessage) {
    data.error = "Validation message element not found.";
} else {
    data.elementsFound = true;
    for (const str of data.testStrings) {
        characterInput.value = str;
        checkButton.click();
        // Allow a small delay for potential async operations, though not strictly necessary for synchronous checks
        // await new Promise(resolve => setTimeout(resolve, 50));
        data.results.push({
            inputString: str,
            validationMessageValue: validationMessage.value,
            isValid: validationMessage.value === "Valid Value"
        });
    }
}

