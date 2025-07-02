import 'package:client_project/services/user_service.dart';
import 'package:client_project/utils/toastification_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals/signals.dart';

class InfoContaController with ToastificationHelper {
  final auth = Modular.get<FirebaseAuth>();
  final _userService = Modular.get<UserService>();
  final TextEditingController email = TextEditingController();
  final TextEditingController senha = TextEditingController();
  final TextEditingController confirmarSenha = TextEditingController();
  final Signal hidePass = Signal(true);
  final Signal hideConfirmPass = Signal(true);

  void changeHidePassword() {
    hidePass.value = !hidePass.value;
  }

  void changeHideConfirmPass() {
    hideConfirmPass.value = !hideConfirmPass.value;
  }

  Future<void> mudarSenha() async {
    try {
      await _userService.mudarSenha(senha.text);
      showAlertSuccess('Senha alterada com sucesso');
    } on FirebaseAuthException catch (_) {
      showAlertError('Não foi possível mudar a senha');
    }
  }

  Future<void> sair() async {
    try {
      await _userService.sair();
      showAlertSuccess('Até a próxima sessão');
    } on FirebaseAuthException catch (_) {
      showAlertError('Não foi possível sair da conta.');
    }
  }
}
