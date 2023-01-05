import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_curitiba/core/data_parser.dart';
import 'package:list_curitiba/modules/task_list/presenter/components/addind_task_component.dart';

import '../../../../core/theme/typography.dart';
import '../controllers/home_controller.dart';

class TaskTileComponent extends StatelessWidget {
  TaskTileComponent({required this.index});
  final int index;

  final _controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
                value: _controller.tasksList![index].done,
                activeColor: Colors.teal,
                onChanged: (value) {
                  _controller.toggleTask(_controller.tasksList![index]);
                }),
            Container(
              width: 200,
              child: Text(
                (_controller.tasksList![index].title),
                style: TextStyle(color: Colors.grey[800], fontSize: 18),
              ),
            ),
          ],
        ),
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        content: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(8),
                            child: SingleChildScrollView(
                                child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Modular.to.pop();
                                        showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            barrierColor:
                                                Colors.grey.withOpacity(.4),
                                            context: context,
                                            isScrollControlled: true,
                                            builder: (context) {
                                              return AddingTaskComponent(
                                                task: _controller
                                                    .tasksList![index],
                                              );
                                            });
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.grey,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        Modular.to.pop();
                                        _controller.deleteTask(
                                            _controller.tasksList![index].id);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      )),
                                ],
                              ),
                              Text('Tarefa', style: h3),
                              SizedBox(height: 8),
                              Text(_controller.tasksList![index].title,
                                  style: h2),
                              if (_controller.tasksList![index].description !=
                                  null)
                                SizedBox(height: 8),
                              if (_controller.tasksList![index].description !=
                                  null)
                                Text('Descrição', style: h3),
                              if (_controller.tasksList![index].description !=
                                  null)
                                SizedBox(height: 8),
                              if (_controller.tasksList![index].description !=
                                  null)
                                Text(_controller.tasksList![index].description!,
                                    style: h2),
                              SizedBox(height: 16),
                              Text(
                                'Última modificação:\n${DateParser.getDateWithTimeString(_controller.tasksList![index].createdAt)} ',
                                style: h2,
                                textAlign: TextAlign.center,
                              )
                            ]))));
                  });
            },
            icon: Icon(
              Icons.info,
              color: Colors.grey,
            ))
      ],
    ));
  }
}
