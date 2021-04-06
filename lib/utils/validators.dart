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