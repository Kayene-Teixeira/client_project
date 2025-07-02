import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserService {
  final auth = Modular.get<FirebaseAuth>();

  Future<void> entrar(String email, String senha) async {
    await auth.signInWithEmailAndPassword(email: email, password: senha);
  }

  Future<void> criarConta(String email, String senha) async {
    await auth.createUserWithEmailAndPassword(email: email, password: senha);
    if (auth.currentUser != null) {
      await auth.currentUser!.sendEmailVerification();
    }
  }

  Future<void> mudarSenha(String senha) async {

  }

  Future<void> sair() async {
    await auth.signOut();
  }
}
