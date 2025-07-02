import 'package:client_project/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:signals/signals_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = Modular.get<LoginController>();
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(screenSize.width * 0.1),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: theme.colorScheme.primary,
                  child: Icon(Icons.person_2_rounded, color: Colors.white),
                ),
                Padding(padding: EdgeInsets.all(screenSize.width * 0.04)),
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
                    obscureText: controller.hidePassword.value,
                    controller: controller.senha,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.changeHidePassword();
                        },
                        icon: FaIcon(
                          controller.hidePassword.value
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                        ),
                      ),
                    ),
                  );
                }),
                Padding(padding: EdgeInsets.all(screenSize.width * 0.04)),
                ElevatedButton(
                  onPressed: () async {
                    await controller.entrar();
                  },
                  child: Text('Entrar'),
                ),
                TextButton(
                  onPressed: () {
                    Modular.to.pushNamed('/criar-conta');
                  },
                  child: Text('Criar conta'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
