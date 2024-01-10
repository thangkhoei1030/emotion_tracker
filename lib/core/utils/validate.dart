import 'package:emotion_tracker/core/src_core.dart';

String? passwordValidate({
  required String password,
}) {
  RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,50}$');
  if (password.isStringNotEmpty) {
    // Trường hợp có yêu cầu nhập tối đa vào mật khẩu.
    if (!regex.hasMatch(password)) {
      return 'Enter valid password';
    } else {
      return null;
    }
  }
  return 'Enter valid password';
}

String? validateInput({String? value, required String nameField}) {
  if (value.isStringNotEmpty) {
    return null;
  }
  return "$nameField không được để trống";
}

String? validateOTP({String? value}) {
  if (value.isStringNotEmpty && value!.length == 5) {
    return null;
  }
  return "OTP không hợp lệ";
}

extension StringUtils on String? {
  bool get isStringNotEmpty => this != null && this!.trim().isNotEmpty;

  bool get isStringEmpty =>
      (this != null && this!.trim().isEmpty) || this == null;
}

bool isListNotEmpty(List<dynamic>? list) => list != null && list.isNotEmpty;

String convertDoubleToStringSmart(double? value) {
  return '${value?.toInt() == value ? value?.toInt() : value}';
}

bool isPhoneValidate({required String? value}) {
  if (value == null) return false;
  if (value.trim().isEmpty || !RegExp(r'\d{10,14}').hasMatch(value)) {
    return false;
  }
  return true;
}

bool isIdentityCard({required String? value}) {
  if (value == null) return false;
  if (value.trim().isEmpty || !RegExp(r'\d{9,12}').hasMatch(value)) {
    return false;
  }
  return true;
}

bool isTaxCode({required String? taxCode}) {
  if (taxCode!.length < 10) return false;
  return true;
}

bool isEmail(String? value) {
  RegExp email = RegExp(
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");

  if (value == null) return false;
  if (value.trim().isEmpty || !email.hasMatch(value.toLowerCase())) {
    return false;
  }

  return true;
}

bool validateId(int? id) {
  return id != AppConst.defaultIdInvalid;
}
