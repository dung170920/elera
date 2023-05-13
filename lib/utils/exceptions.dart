class AppExceptions implements Exception {
  final String message;

  const AppExceptions([
    this.message = 'An unknown exception occurred.',
  ]);

  factory AppExceptions.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const AppExceptions(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const AppExceptions(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const AppExceptions(
          'An account already exists for this email.',
        );
      case 'operation-not-allowed':
        return const AppExceptions(
          'Operation is not allowed. Please contact support.',
        );
      case 'weak-password':
        return const AppExceptions(
          'Please enter a stronger password.',
        );
      case 'user-not-found':
        return const AppExceptions(
          'No account exists for this email.',
        );
      case 'wrong-password':
        return const AppExceptions(
          'Password is wrong',
        );
      case 'too-many-requests':
        return const AppExceptions(
          'Account temporary block because password is wrong many time',
        );
      case 'account-exists-with-different-credential':
        return const AppExceptions(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const AppExceptions(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const AppExceptions(
          'Operation is not allowed. Please contact support.',
        );
      case 'user-disabled':
        return const AppExceptions(
          'This user has been disabled. Please contact support for help.',
        );
      case 'invalid-verification-code':
        return const AppExceptions(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const AppExceptions(
          'The credential verification ID received is invalid.',
        );
      default:
        return const AppExceptions();
    }
  }
}
