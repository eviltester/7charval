const characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789*";
const stringLength = 7;
const requiredCharacters = new Set(characters);
const testStrings = [];
const generatedCharacters = new Set();
let attempts = 0;
const maxAttempts = 10000; // Limit attempts to avoid infinite loops in case coverage is hard

// Generate strings until all characters are covered or max attempts reached
while (generatedCharacters.size < requiredCharacters.size && attempts < maxAttempts) {
    let randomString = '';
    let stringContainsNewCharacter = false;
    for (let j = 0; j < stringLength; j++) {
        const randomIndex = Math.floor(Math.random() * characters.length);
        const char = characters[randomIndex];
        randomString += char;
        if (!generatedCharacters.has(char)) {
            generatedCharacters.add(char);
            stringContainsNewCharacter = true;
        }
    }
     if (stringContainsNewCharacter || testStrings.length < requiredCharacters.size / stringLength + 5) {
        testStrings.push(randomString);
    }
    attempts++;
}

console.log(`Generated ${testStrings.length} test strings covering all required characters (attempted ${attempts} times).`);

const validInputs = [];
const invalidInputs = [];
const characterInput = document.querySelector('input[name="characters"]');
const checkButton = document.querySelector('input[type="button"][value="Check Input"]');
const validationMessage = document.querySelector('input[name="validation_message"]');

if (!characterInput) {
    console.error("Character input with name 'characters' not found.");
} else if (!checkButton) {
    console.error("Check Input button not found.");
} else if (!validationMessage) {
    console.error("Validation message element not found.");
} else {
    console.log("Starting validation tests...");
    for (const str of testStrings) {
        characterInput.value = str;
        checkButton.click();
        // In some cases, you might need a small delay here for asynchronous updates:
        // await new Promise(resolve => setTimeout(resolve, 50));
        if (validationMessage.value === "Valid Value") {
            validInputs.push(str);
            console.log(`Input "${str}" passed validation.`);
        } else {
            invalidInputs.push(str);
            console.warn(`Input "${str}" failed validation. Received: "${validationMessage.value}"`);
        }
    }
    console.log('Validation tests complete.');
    console.log("Valid inputs:", validInputs);
    console.log("Invalid inputs:", invalidInputs);


    if (invalidInputs.length > 0) {
        throw new Error("Validation failed for some inputs. See invalidInputs array for details.");
    }
}



