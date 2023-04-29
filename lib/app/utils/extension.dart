extension TextValidators on String {
  bool isValidName() {
    return trim().isEmpty ? false : true;
  }

  bool isValidPhone() {
    String regexPattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
    var regExp = RegExp(regexPattern);

    if (trim().isEmpty) {
      return false;
    } else if (regExp.hasMatch(trim())) {
      return true;
    }
    return false;
  }

  bool isValidEmail() {
    if (trim().isEmpty) {
      return false;
    } else if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(trim())) {
      return true;
    }
    return false;
  }

  bool isValidPassword(){
     if (trim().isEmpty) {
       return false;
     } else if (RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$')
         .hasMatch(trim())) {
       return true;
     }
     return false;

  }
}
