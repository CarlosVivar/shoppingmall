/***************************************************************
 * Author: tqthe
 * 
 * 
 */

// days of month
a = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

function isLeapYear(y) {
    return (y % 400 == 0) || ((y % 4 == 0) && (y % 100 != 0));
}

// unused
function checkDate(d,m,y) {
    if (isLeapYear(y) && m == 2) {
        return (d > 0) && (d <= 29);
    }
    return (d > 0) && (d <= a[m]);
}

// create new select box days
function createNewSelectDay(max, selectedIndex) {
	var d = document.getElementById("dd");
	//var d_value=d.value;
	removeAllOptions(d);
	for (var i = 1; i <= max; i++) {
		addSelectOption(d, i, i, selectedIndex == i);
	}
}

// add new option into existing selected box
function addSelectOption(selectObj, text, value, isSelected) {
    if (selectObj != null && selectObj.options != null) {
    	var objOption = document.createElement("option");
    	objOption.text = text;
    	objOption.value = value;
    	objOption.selected = isSelected;
        selectObj.options[selectObj.options.length] = objOption;
    }
}

// remove all options from selected box
function removeAllOptions(selectedObj) {
	selectedObj.options.length = 0;
}

// adopt idea from Facebook registration form 
function adaptDay() {
	var m = parseInt(document.getElementById("mm").value); 	
	var y = parseInt(document.getElementById("yyyy").value);
	var index = document.getElementById("dd").selectedIndex;
	//alert(index);
	if (m == 0) {
		createNewSelectDay(31, index);
	} else {
		if (isLeapYear(y) && m == 2) {
			createNewSelectDay(29, index);
		} else {
			createNewSelectDay(a[m], index);
		}
	}
}

// check for input date
function checkForm() {
	var d = document.getElementById("dd").value;
	var m = parseInt(document.getElementById("mm").value) + 1; 	
	var y = parseInt(document.getElementById("yyyy").value) + 1900;
	
	var errorField = document.getElementById("dateRequired");
	if (!validate(d, m, y)) {
		errorField.innerText = "No day selected";
		return false;
	}
	errorField.innerText = "";
	return true;
}

//check for input date
function checkForm02() {
	var d = document.getElementById("dd").value;
	var m = parseInt(document.getElementById("mm").value) + 1; 	
	var y = parseInt(document.getElementById("yyyy").value) + 1900;
	
	var errorField = document.getElementById("dateRequired");
	if (!validate(d, m, y)) {
		errorField.innerText = "No dates selected";
		return false;
	}
	errorField.innerText = "";
	return true;
}

function validate(d,m,y) {
	if (y <= 0 || m < 0) return false;
	
    if (isLeapYear(y) && m == 2) {
        return d > 0 && d <= 29;
    }
    return d > 0 && d <= a[m];
}

//check for add new bill form
function checkBillForm() {
	var d = document.getElementById("dd").value;
	var m = parseInt(document.getElementById("mm").value) + 1; 	
	var y = parseInt(document.getElementById("yyyy").value) + 1900;
	var hour = parseInt(document.getElementById("hour").value);
	var minute = parseInt(document.getElementById("minute").value);
	
	var dateErrorField = document.getElementById("dateRequired");
	if (!validate(d, m, y)) {
		dateErrorField.innerText = "No dates selected";
		return false;
	}
	else {
    	dateErrorField.innerText = "";
	}

	var timeErrorField = document.getElementById("timeRequired");
	if (hour < 0 || minute < 0) {
		timeErrorField.innerText = "No dates selected";
		return false;
	} else {
		timeErrorField.innerText = "";
	}
	
	return true;
}
