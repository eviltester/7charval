const characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789*";
const stringLength = 7;
const numberOfStringsToGenerate = 100; // Adjust this number to generate more or fewer strings
const testStrings = [];

for (let i = 0; i < numberOfStringsToGenerate; i++) {
  let randomString = '';
  for (let j = 0; j < stringLength; j++) {
    const randomIndex = Math.floor(Math.random() * characters.length);
    randomString += characters[randomIndex];
  }
  testStrings.push(randomString);
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
    console.log(`Testing ${testStrings.length} randomly generated strings...`);
    for (const str of testStrings) {
        characterInput.value = str;
        checkButton.click();
        // In some cases, you might need a small delay here for asynchronous updates:
        // await new Promise(resolve => setTimeout(resolve, 50));
        const isValid = validationMessage.value === "Valid Value";
        console.log(`Input: "${str}", Validation: "${validationMessage.value}", Is Valid: ${isValid}`);
    }
    console.log('Testing complete.');
}

