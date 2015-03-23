/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function popupWindow() {
    window.open("message");
}

function validateForm() {

    // Get references to the form elements
    var pass1 = document.forms["signup"]["pass1"].value;
    var pass2 = document.forms["signup"]["pass2"].value;

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
    alert("Signup Success..");
    RedirectToStart();
}

function signupError() {
    alert("Signup Failed..");
    RedirectToError();
}

function validateForm() {    
    var username = document.forms["signup"]["username"].value;
    var pass1 = document.forms["signup"]["pass1"].value;
    var pass2 = document.forms["signup"]["pass2"].value;
    var eMail = document.forms["signup"]["eMail"].value;

    if (username == null || username == "") {
        alert("Provide Username");
        return false;
    }
    else if (pass1 == null || pass1 == "") {
        alert("Password must be filled out");
        return false;
    }
    else if (pass2 == null || pass2 == "") {
        alert("Both passwords must be filled out");
        return false;
    }
    else if (eMail == null || eMail == "") {
        alert("Provide E-Mail address");
        return false;
    }
    else {
        if (pass1 != pass2) {
            alert("Passwords must be same");
            return false;
        }
        else{
            return true;
        }
    }
}

function foo() {
    theApplet = document.getElementById("app");
        // The following line clobbers the document...
    //document.write(theApplet.method());
    document.getElementById("display").innerHTML = theApplet.method();
}

function RedirectToError() {
    window.location = "http://localhost:8080/BookStore/Error.jsp";
}

function RedirectToStart() {
    window.location = "http://localhost:8080/BookStore";
}
