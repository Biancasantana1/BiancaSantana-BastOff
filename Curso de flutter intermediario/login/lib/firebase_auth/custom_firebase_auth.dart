import 'package:firebase_auth/firebase_auth.dart';
import 'auth_interface.dart';
import 'auth_result.dart';

class CustomFirebaseAuth implements AuthInterface {
  CustomFirebaseAuth._internal();
  static final CustomFirebaseAuth _singleton = CustomFirebaseAuth._internal();
  factory CustomFirebaseAuth() => _singleton;

  @override
  Future<AuthResult> register(
      {String? name, String? email, String? pass}) async {
    if (_isValidsInputs(name!, email!, pass!)) {
      try {
        final result =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: pass,
        );
        result.user!.updateDisplayName(name);
        return result.user != null
            ? AuthResult(userId: result.user!.uid, userName: name)
            : AuthResult(msgError: 'Não foi possível criar a conta!');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          return AuthResult(msgError: 'O e-mail já está em uso!');
        } else if (e.code == 'weak-password') {
          return AuthResult(msgError: 'A senha é muito fraca!');
        } else if (e.code == 'invalid-email') {
          return AuthResult(msgError: 'O e-mail fornecido é inválido!');
        }
      }
    }
    return AuthResult(msgError: 'Insira nome, e-mail e senha válidos!');
  }

  @override
  Future<AuthResult> login({String? email, String? pass}) async {
    if (_isValidsInputs(null, email!, pass!)) {
      try {
        final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: pass,
        );
        return result.user != null
            ? AuthResult()
            : AuthResult(msgError: 'Não autenticado!');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          return AuthResult(msgError: 'Email não encontrado!');
        } else if (e.code == 'wrong-password') {
          return AuthResult(msgError: 'Senha incorreta!');
        }
      }
    }
    return AuthResult(msgError: 'Usuário não encontrado!');
  }

  bool _isValidsInputs(String? name, String email, String pass) =>
      (name == null || name.isNotEmpty) &&
      email.isNotEmpty &&
      pass.isNotEmpty &&
      pass.length >= 6;

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
