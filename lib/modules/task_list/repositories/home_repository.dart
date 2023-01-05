import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:list_curitiba/core/errors/failures.dart';
import 'package:list_curitiba/modules/task_list/models/task_model.dart';

import '../errors/home_failures.dart';

abstract class IHomeRepository {
  Future<Either<Failure, Unit>> createTask(TaskModel task);
  Future<Either<Failure, Unit>> editTask(TaskModel task);
  Future<Either<Failure, Unit>> deleteTask(String id);
  Future<Either<Failure, Unit>> toggleTask(TaskModel task);
  Future<Either<Failure, List<TaskModel>>> getTasks();
}

class HomeRepository implements IHomeRepository {
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, List<TaskModel>>> getTasks() async {
    try {
      final result = await _database.collection('tasks').get();

      final temp = await result.docs
          .map((e) => TaskModel.fromMap(Map<String, dynamic>.from(e.data())))
          .toList();

      return Right(temp);
    } catch (e) {
      return Left(TasksFailure(
          title: 'Ocorreu um erro',
          message: 'Não foi possível obter as tarefas'));
    }
  }

  @override
  Future<Either<Failure, Unit>> createTask(task) async {
    try {
      await _database.collection('tasks').doc(task.id).set({
        'title': task.title,
        'id': task.id,
        'createdAt': task.createdAt.millisecondsSinceEpoch,
        'description': task.description,
        'done': false,
      });
      return Right(unit);
    } catch (e) {
      return Left(TasksFailure(
          title: 'Ocorreu um erro',
          message: 'Não foi possível criar a tarefa'));
    }
  }

  @override
  Future<Either<Failure, Unit>> toggleTask(TaskModel task) async {
    try {
      await _database.collection('tasks').doc(task.id).update({
        'done': !task.done,
      });
      return Right(unit);
    } catch (e) {
      return Left(TasksFailure(
          title: 'Ocorreu um erro',
          message: 'Não foi possível mudar o status'));
    }
  }

  @override
  Future<Either<Failure, Unit>> editTask(TaskModel task) async {
    try {
      await _database.collection('tasks').doc(task.id).update({
        'title': task.title,
        'createdAt': task.createdAt.millisecondsSinceEpoch,
        'description': task.description,
        'done': task.done,
      });
      return Right(unit);
    } catch (e) {
      return Left(TasksFailure(
          title: 'Ocorreu um erro',
          message: 'Não foi possível editar a tarefa'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTask(String id) async {
    try {
      await _database.collection('tasks').doc(id).delete();
      return Right(unit);
    } catch (e) {
      return Left(TasksFailure(
          title: 'Ocorreu um erro',
          message: 'Não foi possível apagar a tarefa'));
    }
  }
}
