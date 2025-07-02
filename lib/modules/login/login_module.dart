import 'package:client_project/modules/login/login_controller.dart';
import 'package:client_project/modules/login/login_page.dart';
import 'package:client_project/services/user_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
    i.add(LoginController.new);
    i.add(UserService.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => LoginPage());
  }
}
