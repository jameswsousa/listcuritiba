import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_curitiba/modules/task_list/presenter/pages/home_page.dart';
import 'package:list_curitiba/modules/task_list/repositories/home_repository.dart';

import 'presenter/controllers/home_controller.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i())),
        Bind<IHomeRepository>((i) => HomeRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => HomePage()),
      ];
}
