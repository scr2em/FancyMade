String emailValidator(val) {
  return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(val)
      ? null
      : "Enter a valid email.";
}

String passwordValidator(val) {
  return val.length < 6 ? "Password must be more than 6 characters." : null;
}

String notEmpty(val){
  return (val == null || val.isEmpty) ? "This field can't be empty" : null;

}

String maxQuantity(val){
  return val.length > 2 ? "You can't choose more than 99 items in a single order" : null;
}
String checkPhoneNumber(val){
  return RegExp(r"^(011|012|010|015)\d{8}$").hasMatch(val) ? null : "Enter a valid phone number";
}