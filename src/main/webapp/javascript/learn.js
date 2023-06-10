
function validFromData(){
    //collect form data in JavaScript variables
    var firstPassword = document.getElementById("firstPassword").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
    var name = document.getElementById("name").value;
    var email = document.getElementById("email").value;
    var phone = document.getElementById("number").value;
    var address = document.getElementById("address").value;
    // Check Empty Name
    if (name == ""){
        document.getElementById("blankName").innerHTML = "Fill The Name Filed";
        return false;
    }
    //  Only Character  Value input Give
    if (!isNaN(name)){
        document.getElementById("blankName").innerHTML = "Only Character Value";
        return false;
    }
    // Check Email Empty
    if (email == ""){
        document.getElementById("blankEmail").innerHTML = "Fill The Email Field";
        return false;
    }
    // Empty Password
    if (firstPassword == ""){
        document.getElementById("notReadyPassword").innerHTML = "Fill The Password Field";
        return  false;
    }
    if (confirmPassword = ""){
        document.getElementById("blankPassword2").innerHTML = "Fill The Password Field";
        return  false;
    }
    //   Minimum Password length validate()
    if (firstPassword < 8){
        document.getElementById("notReadyPassword").innerHTML = "Password length  Minimum  8";
        return false;
    }
    //  Maxime  Password length validate()
    if (firstPassword < 15){
        document.getElementById("notReadyPassword").innerHTML = "Password length Maxime 15";
        return false;
    }
    if (firstPassword != confirmPassword){
        document.getElementById("blankPassword2").innerHTML = "The First & Second Password Are Not Same !"
        return false
    }
    if(phone = ""){
        document.getElementById("blankPhone").innerHTML = "Fill The Mobile Number";
        return false;
    }
    if (phone < 12){
        document.getElementById("blankPhone").innerHTML = "Fill The 11 Digit Mobile Number";
        return false;
    }
    if (address = ""){
        document.getElementById("blankAddress").innerHTML = "Fill The Address Box";
        return false;
    }

}








const from = document.getElementById('from ');
const firstPassword = document.getElementById('firstPassword');
const confirmPassword = document.getElementById('confirmPassword');
const name = document.getElementById('name');
const email = document.getElementById('email');
const phone = document.getElementById('name');
const address = document.getElementById('address');

function showError(input, message) {
    const formGroup = input.parentElement;
    formGroup.className = 'form-group  error';
    const small = formGroup.querySelector('small');
    small.innerText = message;
}

function showSuccess(input) {
    const formGroup = input.parentElement;
    formGroup.className = 'form-group success';
}

// Even listeners
from.addEventListener('submit', function (e) {
    e.preventDefault();
    if (name.value === '') {
        showError(name, 'Name Is Required')
    } else {
        showSuccess(name);
    }
})
