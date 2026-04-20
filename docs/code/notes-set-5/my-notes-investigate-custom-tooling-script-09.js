let inputVal = 
    document.querySelector('input[name="characters"]').value;
let outputVal = 
    document.querySelector('input[name="validation_message"]').value;

setInterval(function(){
    let currInputVal = 
        document.querySelector('input[name="characters"]').value;
    let currOutputVal = 
        document.querySelector('input[name="validation_message"]').value;
    if(inputVal!== currInputVal || outputVal !== currOutputVal){
        inputVal= currInputVal;
        outputVal = currOutputVal
        console.log(`checked - ${inputVal} == ${outputVal}`);
    }
},200);

