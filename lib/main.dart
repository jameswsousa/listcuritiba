import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_curitiba/modules/task_list/presenter/pages/home_page.dart';
import 'package:list_curitiba/modules/task_list/root/app.dart';
import 'package:list_curitiba/modules/task_list/root/app_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ModularApp(module: AppModule(), child: const App()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'To Do List',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: HomePage());
  }
}
