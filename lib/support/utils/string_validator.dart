class StringValidator {
  StringValidator._();

  static final RegExp _base64 = RegExp(
      r'^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{4})$');

  static bool isBase64(String? str) {
    return str == null ? false : _base64.hasMatch(str);
  }
}
