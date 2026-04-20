const targetNode =document.querySelector('[name="validation_message"]');

const config = { attributes: true, childList: true, subtree: true, characterData: true };

// Callback function to execute when mutations are observed
const callback = function(mutationList, observer) {
    let inputVal = 
        document.querySelector('input[name="characters"]').value;
    let outputVal = 
        document.querySelector('input[name="validation_message"]').value;
    console.log(`checked - ${inputVal} == ${outputVal}`);
};

// Create an observer instance linked to the callback function
const observer = new MutationObserver(callback);

// Start observing the target node for configured mutations
observer.observe(targetNode, config);

