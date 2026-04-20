document.querySelector('[name="validation_message"]').
addEventListener("change", function(){
    let inputVal = 
        document.querySelector('input[name="characters"]').value;
    let outputVal = 
        document.querySelector('input[name="validation_message"]').value;
    console.log(`checked - ${inputVal} == ${outputVal}`);
    });

