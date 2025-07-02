import 'package:client_project/modules/criar_conta/criar_conta_controller.dart';
import 'package:client_project/modules/criar_conta/criar_conta_page.dart';
import 'package:client_project/services/user_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CriarContaModule extends Module {
  @override
  void binds(Injector i) {
    i.add(CriarContaController.new);
    i.add(UserService.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => CriarContaPage());
  }
}
