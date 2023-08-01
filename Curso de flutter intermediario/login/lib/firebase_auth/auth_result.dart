class AuthResult {
  final String? userId;
  final String? msgError;
  final String? userName;

  AuthResult({this.userId, this.msgError, this.userName});

  bool get isSucess => msgError == null;
}
