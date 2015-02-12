/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//function popupWindow(message) {
//    window.open(message);
//}

function validateForm() {

    // Get references to the form elements:
    var pass1 = Document.getElementById("pass1");
    var pass2 = Document.getElementById("pass2");

    // Validate the login
    if (pass1 === pass2) {
        return true;
    } else {
        alert('Please complete the form!');
        return false;
    }
}

function exceptionShow() {
    alert(arguments[0]);
}

function signup() {
    alert(arguments[0]);
}
