import 'package:formz/formz.dart';

class EmailValidationError {
  final String text;

  EmailValidationError(this.text);

  @override
  String toString() => text;
}

class PasswordValidationError {
  final String text;

  PasswordValidationError(this.text);

  @override
  String toString() => text;
}

class RePasswordValidationError {
  final String text;

  RePasswordValidationError(this.text);

  @override
  String toString() => text;
}

class TextValidationError {
  final String text;

  TextValidationError(this.text);

  @override
  String toString() => text;
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
        : EmailValidationError('Please ensure the email entered is valid');
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
        : PasswordValidationError(
            'Password must be at least 8 characters and contain 1 upper character, 1 lower character, 1 number and 1 special character');
  }
}

class RePasswordInput extends FormzInput<String, RePasswordValidationError> {
  final String password;

  const RePasswordInput.pure([this.password = '', super.value = ''])
      : super.pure(); // khởi tạo

  const RePasswordInput.dirty({required this.password, String value = ''})
      : super.dirty(value); // check lỗi

  @override
  RePasswordValidationError? validator(String value) {
    return password == value
        ? null
        : RePasswordValidationError(
            'Password and confirm password does not match');
  }
}

class TextInput extends FormzInput<String, TextValidationError> {
  final int min;
  final int max;

  const TextInput.pure({this.min = 1, String value = '', this.max = 100})
      : super.pure(value);
  const TextInput.dirty({this.min = 1, String value = '', this.max = 100})
      : super.dirty(value);

  @override
  TextValidationError? validator(String? value) {
    if (value == null || value.isEmpty)
      return TextValidationError('This field is required');

    if (value.length < min || value.length > max)
      return TextValidationError(
          'This field must be from $min to $max characters');

    return null;
  }
}
