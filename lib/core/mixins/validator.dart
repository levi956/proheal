mixin Validator {
  String? validateEmail(String? email) {
    if (email!.isNotEmpty) {
      bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      ).hasMatch(email);
      if (!emailValid) {
        return 'Invalid Email Address';
      }
    } else {
      return 'Invalid Email Address';
    }
    return null;
  }
}
