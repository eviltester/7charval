const characterInput = document.querySelector('input[type="text"]');
if (characterInput) {
  characterInput.value = 'Aabbccd';
}

const checkButton = document.querySelector('input[type="button"][name="validate"]');
if (checkButton) {
  checkButton.click();
}

const validationMessage = document.querySelector('input[name="validation_message"]');
if (validationMessage) {
  if (validationMessage.value === 'Valid Value') {
    console.log('Validation message is "Valid Value".');
  } else {
    console.log('Validation message is NOT "Valid Value". It is: ' + validationMessage.value);
  }
} else {
  console.log('Validation message element not found.');
}

