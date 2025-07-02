import 'package:client_project/services/user_service.dart';
import 'package:client_project/utils/toastification_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals/signals.dart';

class CriarContaController with ToastificationHelper {
  final TextEditingController email = TextEditingController();
  final TextEditingController senha = TextEditingController();
  final TextEditingController confirmarSenha = TextEditingController();
  final _userService = Modular.get<UserService>();
  final Signal hidePass = Signal(true);
  final Signal hideConfirmPass = Signal(true);
  bool cadastrou = false;

  void changeHidePassword() {
    hidePass.value = !hidePass.value;
  }

  void changeHideConfirmPass() {
    hideConfirmPass.value = !hideConfirmPass.value;
  }

  Future<void> criarConta() async {
    try {
      if (email.text.isEmpty) {
        showAlertError('Informe um e-mail');
        return;
      }
      if (senha.text.isEmpty) {
        showAlertError('Informe uma senha');
        return;
      }
      if (senha.text.length < 6) {
        showAlertError('A senha deve ter 6 ou mais caracteres');
        return;
      }
      if (senha.text != confirmarSenha.text) {
        showAlertError('As senhas não são iguais');
        return;
      }
      await _userService.criarConta(email.text, senha.text);
      cadastrou = true;
      showAlertSuccess(
        'Conta criada com sucesso. Verifique seu e-mail na caixa de entrada.',
      );
      Modular.to.pushReplacementNamed('/conta');
    } on FirebaseAuthException catch (_) {
      showAlertError('Não foi possível criar a conta');
    }
  }
}
