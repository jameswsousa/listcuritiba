import 'package:list_curitiba/core/enums/app_states.dart';
import 'package:list_curitiba/core/errors/failures.dart';
import 'package:list_curitiba/modules/task_list/models/task_model.dart';
import 'package:list_curitiba/modules/task_list/repositories/home_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IHomeRepository _repository;

  _HomeControllerBase(this._repository);

  @observable
  String? title;

  @observable
  String? description;

  @observable
  Failure? failure;

  @observable
  AppStatesEnum homeState = AppStatesEnum.noState;

  @observable
  List<TaskModel>? tasksList;

  @action
  Future<void> getTasks() async {
    tasksList = null;
    final result = await _repository.getTasks();
    result.fold((l) {
      failure = l;
      homeState = AppStatesEnum.error;
    }, (r) {
      tasksList = r;
      homeState = AppStatesEnum.loaded;
    });
  }

  @action
  Future<void> createTask() async {
    final id = Uuid().v4();
    final result = await _repository.createTask(TaskModel(
        id: id,
        title: title!,
        description: description,
        createdAt: DateTime.now(),
        done: false));
    result.fold((l) {
      failure = l;
      homeState = AppStatesEnum.error;
    }, (r) {
      homeState = AppStatesEnum.loaded;
      getTasks();
    });
  }

  @action
  Future<void> editTask(TaskModel task) async {
    final result = await _repository.editTask(TaskModel(
        id: task.id,
        title: title!,
        description: description!,
        createdAt: DateTime.now(),
        done: task.done));
    result.fold((l) {
      failure = l;
      homeState = AppStatesEnum.error;
    }, (r) {
      homeState = AppStatesEnum.loaded;
      getTasks();
    });
  }

  @action
  Future<void> toggleTask(TaskModel task) async {
    final result = await _repository.toggleTask(task);
    result.fold((l) {
      failure = l;
      homeState = AppStatesEnum.error;
    }, (r) {
      homeState = AppStatesEnum.loaded;
      getTasks();
    });
  }

  @action
  Future<void> deleteTask(String id) async {
    final result = await _repository.deleteTask(id);
    result.fold((l) {
      failure = l;
      homeState = AppStatesEnum.error;
    }, (r) {
      homeState = AppStatesEnum.loaded;
      getTasks();
    });
  }

  @action
  void cleanFields() {
    title = null;
    description = null;
  }
}
