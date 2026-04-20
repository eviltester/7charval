const data = {};
const characterInput = document.querySelector('input[type="text"]');
if (characterInput) {
  characterInput.value = 'Aabbccd';
  data.characterInputExists = true;
} else {
  data.characterInputExists = false;
}

const checkButton = Array.from(document.querySelectorAll('button')).find(button => button.textContent === 'Check Input');
if (checkButton) {
  checkButton.click();
  data.checkButtonExists = true;
} else {
  data.checkButtonExists = false;
}

const validationMessage = document.getElementById('validation_message');
if (validationMessage) {
  data.validationMessageValue = validationMessage.textContent;
  data.validationMessageExists = true;
} else {
  data.validationMessageExists = false;
}

