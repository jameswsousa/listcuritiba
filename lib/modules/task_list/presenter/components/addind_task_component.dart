import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_curitiba/modules/task_list/models/task_model.dart';
import '../controllers/home_controller.dart';
import 'default_text_field.dart';

class AddingTaskComponent extends StatelessWidget {
  AddingTaskComponent({this.task});

  final TaskModel? task;

  final _controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    if (task != null) {
      _controller.title = task!.title;
      _controller.description = task!.description;
    }
    return Container(
      padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 15),
          DefaultTextField(
            initialValue: task == null ? null : task!.title,
            onChanged: (value) {
              _controller.title = value;
            },
          ),
          SizedBox(height: 15),
          DefaultTextField(
            initialValue: task == null ? null : task!.description,
            onChanged: (value) {
              _controller.description = value;
            },
          ),
          SizedBox(height: 15),
          Observer(builder: (context) {
            return TextButton(
                onPressed:
                    _controller.title == null || _controller.title!.isEmpty
                        ? null
                        : task == null
                            ? () {
                                _controller.createTask();
                                Modular.to.pop();
                                _controller.cleanFields();
                              }
                            : () {
                                _controller.editTask(task!);
                                Modular.to.pop();
                                _controller.cleanFields();
                              },
                child: Text(
                  task == null ? 'Adicionar Tarefa' : 'Editar Tarefa',
                  style: TextStyle(
                      fontSize: 18,
                      color: _controller.title == null ||
                              _controller.title!.isEmpty
                          ? Colors.grey
                          : Colors.teal),
                ));
          })
        ],
      ),
    );
  }
}
