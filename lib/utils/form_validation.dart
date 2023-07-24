import 'package:formz/formz.dart';

class ValidationError {
  final String text;

  ValidationError(this.text);

  @override
  String toString() => text;
}

class EmailInput extends FormzInput<String, ValidationError> {
  const EmailInput.pure([super.value = '']) : super.pure();
  const EmailInput.dirty([super.value = '']) : super.dirty();

  static final _emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  @override
  ValidationError? validator(String? value) {
    return _emailRegex.hasMatch(value ?? '')
        ? null
        : ValidationError('Please ensure the email entered is valid');
  }
}

class PasswordInput extends FormzInput<String, ValidationError> {
  const PasswordInput.pure([super.value = '']) : super.pure(); // khởi tạo

  const PasswordInput.dirty([super.value = '']) : super.dirty(); // check lỗi

  static final _passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,20}$');

  @override
  ValidationError? validator(String value) {
    return _passwordRegex.hasMatch(value)
        ? null
        : ValidationError(
            'Password must contain 6 to 20 characters with at least one of each: uppercase, lowercase, number and special',
          );
  }
}

class RePasswordInput extends FormzInput<String, ValidationError> {
  final String password;

  const RePasswordInput.pure([this.password = '', super.value = ''])
      : super.pure(); // khởi tạo

  const RePasswordInput.dirty({required this.password, String value = ''})
      : super.dirty(value); // check lỗi

  @override
  ValidationError? validator(String value) {
    return password == value
        ? null
        : ValidationError('Password and confirm password does not match');
  }
}

class TextInput extends FormzInput<String, ValidationError> {
  final int min;
  final int max;

  const TextInput.pure({this.min = 1, String value = '', this.max = 100})
      : super.pure(value);
  const TextInput.dirty({this.min = 1, String value = '', this.max = 100})
      : super.dirty(value);

  @override
  ValidationError? validator(String? value) {
    if (value == null || value.isEmpty)
      return ValidationError('This field is required');

    if (value.length < min || value.length > max)
      return ValidationError('This field must be from $min to $max characters');

    return null;
  }
}
