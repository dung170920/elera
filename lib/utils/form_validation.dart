import 'package:formz/formz.dart';

enum EmailValidationError {
  invalid('Please ensure the email entered is valid');

  final String text;

  const EmailValidationError(this.text);
}

enum PasswordValidationError {
  invalid(
      'Password must be at least 8 characters and contain 1 upper character, 1 lower character, 1 number and 1 special character');

  final String text;

  const PasswordValidationError(this.text);
}

enum TextValidationError {
  empty('This field is required'),
  min('This field is required');

  final String text;

  const TextValidationError(this.text);
}

class EmailInput extends FormzInput<String, EmailValidationError> {
  const EmailInput.pure([super.value = '']) : super.pure();
  const EmailInput.dirty([super.value = '']) : super.dirty();

  static final _emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  @override
  EmailValidationError? validator(String? value) {
    return _emailRegex.hasMatch(value ?? '')
        ? null
        : EmailValidationError.invalid;
  }
}

class PasswordInput extends FormzInput<String, PasswordValidationError> {
  const PasswordInput.pure([super.value = '']) : super.pure(); // khởi tạo

  const PasswordInput.dirty([super.value = '']) : super.dirty(); // check lỗi

  static final _passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  @override
  PasswordValidationError? validator(String value) {
    return _passwordRegex.hasMatch(value)
        ? null
        : PasswordValidationError.invalid;
  }
}

class TextInput extends FormzInput<String, TextValidationError> {
  const TextInput.pure([super.value = '']) : super.pure();
  const TextInput.dirty([super.value = '']) : super.dirty();

  // static final _textRegex = RegExp(
  //   r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  // );

  @override
  TextValidationError? validator(String? value) {
    if (value?.trim().length == 0) return TextValidationError.empty;
    if (value?.trim().length == 0) return TextValidationError.empty;
    return null;
  }
}
