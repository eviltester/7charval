// easy online obfuscator at http://tool-galaxy.remiya.com/html/10.html is not very secure but quick and easy enough for this

function processValidation(amethod){
	//alert("firstTry");
	//alert(document.charsform.characters.value);
	var retval;
	

	
	switch (amethod){
	case 1:
		retval=validate1();
		break;
	case 2:
		//retval=validate2();
		break;
	default : alert("No such validation implementation");
	}
	
	var message_text;
	if(retval){
		message_text = "Valid Value";
	}else{
		message_text = "Invalid Value";
	}
	
	document.charsform.validation_message.value = message_text;
	
}

function validate1()
{
// this one only ever checks 1 char
	//alert("validate1");
	var input_len = document.charsform.characters.value.length;
	var acode;
	
	if(input_len < 7){return false;}	
	if(input_len > 8){return false;}	//bug should be >= 8 so this allows 8 character strings
	//alert("ok");
	for (var x = 1; x < input_len; x++) //bug does not check first character
   {
	//alert(x);
		acode = document.charsform.characters.value.charCodeAt(x);
		if (!(charCodeIsValid1(acode))){
			return false;
		}
   }
	//alert("Validate code "+acode+"");
	return true;
}

function charCodeIsValid1(acode)
{
	//alert("Validate code "+acode+"");
	//we want it to check for
	
	
	//* 42
	//0-9 48 - 57
	// A-Z 65 - 90
	// a-z 97 - 122
	
	// as valid, everything else is not
	//http://www.lookuptables.com/
	
	
	if(acode == 42){
		// fixed unit testing bug where == was =
		return true;
	}
	
	if(acode>=48 && acode <=58){
		// bug should be <58 this lets : slip through
		return true;
	}
	
	if(acode>65 && acode<123){
		//bug: should be >=65, A is excluded
		//bug: should be <=90 and >=97 this allows [\]^_` through
		return true;
	}
	
	//alert("Validate code "+acode+" is false");
	//reject anything else
	return false;
}

//

