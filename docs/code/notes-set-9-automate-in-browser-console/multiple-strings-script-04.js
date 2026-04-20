const testStrings = ["AZaz09*", "BBBBBBB", "1234567"];
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

