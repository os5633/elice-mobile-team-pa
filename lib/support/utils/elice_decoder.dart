import 'dart:convert';

class EliceDecoder {
  EliceDecoder._();

  static final RegExp _base64 = RegExp(
      r'^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{4})$');

  static String decodeBase64(String str) {
    if (_base64.hasMatch(str)) {
      return utf8.decode(base64Url.decode(str.toString()));
    }
    return str;
  }
}
