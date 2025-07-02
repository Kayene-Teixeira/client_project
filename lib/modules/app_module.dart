import 'package:client_project/modules/criar_conta/criar_conta_module.dart';
import 'package:client_project/modules/info_conta/info_conta_module.dart';
import 'package:client_project/modules/login/login_module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance(FirebaseAuth.instance);
    i.addInstance(FirebaseFirestore.instance);
  }

  @override
  void routes(RouteManager r) {
    r.module('/login/', module: LoginModule());
    r.module('/criar-conta/', module: CriarContaModule());
    r.module('/conta/', module: InfoContaModule());
  }
}
