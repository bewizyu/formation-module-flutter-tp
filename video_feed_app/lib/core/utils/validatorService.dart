class ValidatorService {
  static String validateEmail(String value) {
    value = value.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return "Please enter a valid E-mail.";
    else
      return null;
  }

  static String samePasswordValidation(String password, String repassword) {
    if (password != repassword) {
      return "Password is not matching";
    } else
      return null;
  }

  static String validatePassword(String value) {
    Pattern pattern = r'^.{8,}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Your password must contain more than 8 characters';
    else
      return null;
  }


  static String validateUrl(String url) {
    if (url == " " || url == "") {
      return null;
    }
    var isvalid = Uri.parse(url).isAbsolute;
    if (!isvalid) {
      return 'Please enter a valid url';
    } else {
      return null;
    }
  }

  static String validateUsername(String value) {
    Pattern pattern = r'^.{4,}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return "Please enter a valid username (minimum 4 letters)";
    else
      return null;
  }

  static String validateNumber(String value) {
    Pattern pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return "Entrez votre nombre s'il vous plaît.";
    else
      return null;
  }
}
