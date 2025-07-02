import 'package:client_project/modules/info_conta/info_conta_controller.dart';
import 'package:client_project/modules/info_conta/info_conta_page.dart';
import 'package:client_project/services/user_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InfoContaModule extends Module {
  @override
  void binds(Injector i) {
    i.add(InfoContaController.new);
    i.add(UserService.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => InfoContaPage());
  }
}
