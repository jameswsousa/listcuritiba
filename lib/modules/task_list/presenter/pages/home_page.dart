import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_curitiba/core/theme/typography.dart';
import 'package:list_curitiba/modules/task_list/presenter/components/task_tile_component.dart';
import 'package:list_curitiba/modules/task_list/presenter/controllers/home_controller.dart';

import '../components/addind_task_component.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Modular.get<HomeController>();

  @override
  void initState() {
    _controller.getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                barrierColor: Colors.grey.withOpacity(.4),
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return AddingTaskComponent();
                });
          }),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Lista de Tarefas',
          style: h1.copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 15),
              Container(
                height: MediaQuery.of(context).size.height * .75,
                width: 200,
                child: Observer(builder: (context) {
                  if (_controller.tasksList == null)
                    return SingleChildScrollView(
                      child: Container(
                        height: 150,
                        width: 150,
                        child: CircularProgressIndicator(
                          color: Colors.teal,
                        ),
                      ),
                    );
                  if (_controller.tasksList!.isEmpty)
                    return Center(
                        child: Text('Lista vazia',
                            style: h1.copyWith(color: Colors.teal[900])));
                  return ListView.builder(
                      itemCount: _controller.tasksList!.length,
                      itemBuilder: (context, index) {
                        _controller.tasksList!.sort(((a, b) => a.createdAt
                            .toString()
                            .compareTo(b.createdAt.toString())));
                        return TaskTileComponent(
                          index: index,
                        );
                      });
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
