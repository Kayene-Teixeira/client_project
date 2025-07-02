import 'package:client_project/modules/info_conta/info_conta_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:signals/signals_flutter.dart';

class InfoContaPage extends StatelessWidget {
  const InfoContaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<InfoContaController>();
    final screenSize = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.9),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey)],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        controller.auth.currentUser != null
                            ? controller.auth.currentUser!.email!
                            : '',
                      ),
                      Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Modular.to.pop();
                            },
                            child: Text('Cancelar'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              controller.mudarSenha();
                            },
                            child: Text('Mudar Senha'),
                          ),
                        ],
                        content: Column(
                          children: [
                            TextFormField(
                              controller: controller.email,
                              decoration: InputDecoration(
                                labelText: 'E-mail',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  borderSide: BorderSide(
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                            Watch((context) {
                              return TextFormField(
                                obscureText: controller.hidePass.value,
                                controller: controller.senha,
                                decoration: InputDecoration(
                                  labelText: 'Senha',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    borderSide: BorderSide(
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
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
                                ),
                              );
                            }),
                            Watch((context) {
                              return TextFormField(
                                obscureText: controller.hideConfirmPass.value,
                                controller: controller.senha,
                                decoration: InputDecoration(
                                  labelText: 'Senha',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    borderSide: BorderSide(
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
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
                                ),
                              );
                            }),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey)],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Alterar Senha'),
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Modular.to.pop();
                            },
                            child: Text('Cancelar'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              await controller.sair();
                            },
                            child: Text('Sair'),
                          ),
                        ],
                        content: Text('Realmente deseja sair?'),
                      );
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey)],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [Text('Sair'), Icon(Icons.logout)]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
