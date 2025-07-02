import 'package:client_project/modules/app.dart';
import 'package:client_project/modules/criar_conta/criar_conta_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:signals/signals_flutter.dart';

class CriarContaPage extends StatelessWidget {
  const CriarContaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = Modular.get<CriarContaController>();
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(title: Text('Criar Conta')),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: controller.email,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: theme.colorScheme.primary),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(screenSize.width * 0.04)),
              Watch((context) {
                return TextFormField(
                  obscureText: controller.hidePass.value,
                  controller: controller.senha,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.changeHidePassword();
                      },
                      icon: FaIcon(
                        controller.hidePass.value
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: theme.colorScheme.primary),
                    ),
                  ),
                );
              }),
              Padding(padding: EdgeInsets.all(screenSize.width * 0.04)),
              Watch((context) {
                return TextFormField(
                  obscureText: controller.hideConfirmPass.value,
                  controller: controller.confirmarSenha,
                  decoration: InputDecoration(
                    labelText: 'Confirmar senha',
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.changeHideConfirmPass();
                      },
                      icon: FaIcon(
                        controller.hideConfirmPass.value
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: theme.colorScheme.primary),
                    ),
                  ),
                );
              }),
              Padding(padding: EdgeInsets.all(screenSize.width * 0.04)),
              ElevatedButton(
                onPressed: () async {
                  await controller.criarConta();
                },
                child: Text('Criar conta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
