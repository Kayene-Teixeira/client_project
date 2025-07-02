import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:toastification/toastification.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Modular.get<FirebaseAuth>();
    final initialRoute = auth.currentUser != null ? '/conta/' : '/login/';

    Modular.setInitialRoute(initialRoute);
    return ToastificationWrapper(
      child: MaterialApp.router(
        routerConfig: Modular.routerConfig,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
            primary: const Color.fromARGB(255, 31, 89, 136),
          ),
        ),
      ),
    );
  }
}
