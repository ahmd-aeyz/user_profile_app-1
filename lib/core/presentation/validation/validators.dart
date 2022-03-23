String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return "Email address can't be empty";
  } else if (!RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(email)) {
    return 'Invalid email format';
  }
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.length < 6) {
    return "Password can't be less than 6 characters";
  }
  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return "Phone can't be less than 6 characters";
  } else if (phone.substring(0, 2) != '01' || phone.length != 11) {
    return 'Invalid phone number';
  }
  return null;
}

String? generalValidator({
  required String? value,
  required String? fieldName,
}) {
  if (value == null || value.isEmpty) {
    return "$fieldName can't be empty";
  }
  return null;
}
