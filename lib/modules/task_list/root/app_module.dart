import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_curitiba/modules/task_list/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // Bind((i) => AppStore(i())),
        // Bind<IAppRepository>((i) => AppRepository(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
      ];
}
