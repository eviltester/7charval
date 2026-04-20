let validChars = 
    "*0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
let errors = [];

// loop over the ascii chars
for(x=0;x<256;x++){

    let aChar=String.fromCharCode(x);
    let expectValid = false;
    let resultExpected = "Invalid Value";

    // decide if the char should be valid or invalid
    if(validChars.includes(aChar)){
        expectValid=true;
        resultExpected = "Valid Value";
    }

    const checkButton = document.querySelector('input[type="button"][name="validate"]')

    for(position=0;position<7;position++){

        // create the input string
        let seedString = "0000000";
        let positions = seedString.split("");
        positions[position]=aChar;
        let inputString = positions.join("");

        // input the string
        document.querySelector(
                    'input[name="characters"]').value=inputString;

        // trigger the process
        checkButton.click();

        // get the output
        let result=document.querySelector(
                    'input[name="validation_message"]').value;

        // document the result
        let reportLine = 
            `Input: "${inputString}" Dec: ${x} `+
            `Position:${position} Expected: "${resultExpected}" `+
            `Output: "${result}"`;

        // add an alert in the reportif it is not what we expected
        let resultPrefix = "";
        if(result!==resultExpected){
            resultPrefix = "**ERROR** ";
            reportLine = `${resultPrefix} ` + reportLine;
            // separate errors out into their own report
            errors.push(reportLine);
        }
        // document all the results
        console.log(reportLine);
    }
}
// report on the errors
console.table(errors);

