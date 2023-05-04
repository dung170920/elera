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

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure([super.value = '']) : super.pure();
  const Email.dirty([super.value = '']) : super.dirty();

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

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure([super.value = '']) : super.pure(); // khởi tạo

  const Password.dirty([super.value = '']) : super.dirty(); // check lỗi

  static final _passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  @override
  PasswordValidationError? validator(String value) {
    return _passwordRegex.hasMatch(value)
        ? null
        : PasswordValidationError.invalid;
  }
}
