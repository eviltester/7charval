// build the basic result report with three lines
let results=[];
results["Valid String"]="";
results["Invalid Value"]="";
results["Valid Value"]="";

for(x=0;x<256;x++){
    let aChar=String.fromCharCode(x);
    let inputString = Array(7).fill(aChar).join('');

    // input the string
    document.querySelector('input[name="characters"]').value=inputString;

    // trigger the process
    processValidation(1);

    // get the result
    let result=document.
                querySelector('input[name="validation_message"]').value;

    // store the results
    let storeResultAs = ","+x;
    if(result=="Valid Value"){
        // if it is valid then add it to the valid string report line
        results["Valid String"] = results["Valid String"]+aChar;
        // because it should be displayable
    }

    // add the char to the appropriate report line based on the output message
    results[result]=results[result]+storeResultAs;
}

// output the results
console.table(results);

