import 'auth_result.dart';

abstract class AuthInterface {
  Future<AuthResult> login({String email, String pass});
  Future<AuthResult> register({String name, String email, String pass});
}
