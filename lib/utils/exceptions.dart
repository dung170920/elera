class FirebaseAuthExceptions implements Exception {
  final String message;

  const FirebaseAuthExceptions([
    this.message = 'An unknown exception occurred.',
  ]);

  factory FirebaseAuthExceptions.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const FirebaseAuthExceptions(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const FirebaseAuthExceptions(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const FirebaseAuthExceptions(
          'An account already exists for this email.',
        );
      case 'operation-not-allowed':
        return const FirebaseAuthExceptions(
          'Operation is not allowed. Please contact support.',
        );
      case 'weak-password':
        return const FirebaseAuthExceptions(
          'Please enter a stronger password.',
        );
      case 'user-not-found':
        return const FirebaseAuthExceptions(
          'No account exists for this email.',
        );
      case 'wrong-password':
        return const FirebaseAuthExceptions(
          'Password is wrong',
        );
      case 'too-many-requests':
        return const FirebaseAuthExceptions(
          'Account temporary block because password is wrong many time',
        );
      default:
        return const FirebaseAuthExceptions();
    }
  }
}
