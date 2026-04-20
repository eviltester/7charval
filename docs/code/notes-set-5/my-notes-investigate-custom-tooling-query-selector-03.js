document.querySelector('[name="validate"]').
addEventListener("click",  function(){
    let inputVal = 
            document.querySelector('input[name="characters"]').value;
    let outputVal = 
            document.querySelector('input[name="validation_message"]').value;
    console.log(`checked - ${inputVal} == ${outputVal}`);
    });

