// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$titleAtom =
      Atom(name: '_HomeControllerBase.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_HomeControllerBase.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$failureAtom =
      Atom(name: '_HomeControllerBase.failure', context: context);

  @override
  Failure? get failure {
    _$failureAtom.reportRead();
    return super.failure;
  }

  @override
  set failure(Failure? value) {
    _$failureAtom.reportWrite(value, super.failure, () {
      super.failure = value;
    });
  }

  late final _$homeStateAtom =
      Atom(name: '_HomeControllerBase.homeState', context: context);

  @override
  AppStatesEnum get homeState {
    _$homeStateAtom.reportRead();
    return super.homeState;
  }

  @override
  set homeState(AppStatesEnum value) {
    _$homeStateAtom.reportWrite(value, super.homeState, () {
      super.homeState = value;
    });
  }

  late final _$tasksListAtom =
      Atom(name: '_HomeControllerBase.tasksList', context: context);

  @override
  List<TaskModel>? get tasksList {
    _$tasksListAtom.reportRead();
    return super.tasksList;
  }

  @override
  set tasksList(List<TaskModel>? value) {
    _$tasksListAtom.reportWrite(value, super.tasksList, () {
      super.tasksList = value;
    });
  }

  late final _$getTasksAsyncAction =
      AsyncAction('_HomeControllerBase.getTasks', context: context);

  @override
  Future<void> getTasks() {
    return _$getTasksAsyncAction.run(() => super.getTasks());
  }

  late final _$createTaskAsyncAction =
      AsyncAction('_HomeControllerBase.createTask', context: context);

  @override
  Future<void> createTask() {
    return _$createTaskAsyncAction.run(() => super.createTask());
  }

  late final _$editTaskAsyncAction =
      AsyncAction('_HomeControllerBase.editTask', context: context);

  @override
  Future<void> editTask(TaskModel task) {
    return _$editTaskAsyncAction.run(() => super.editTask(task));
  }

  late final _$toggleTaskAsyncAction =
      AsyncAction('_HomeControllerBase.toggleTask', context: context);

  @override
  Future<void> toggleTask(TaskModel task) {
    return _$toggleTaskAsyncAction.run(() => super.toggleTask(task));
  }

  late final _$deleteTaskAsyncAction =
      AsyncAction('_HomeControllerBase.deleteTask', context: context);

  @override
  Future<void> deleteTask(String id) {
    return _$deleteTaskAsyncAction.run(() => super.deleteTask(id));
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  void cleanFields() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.cleanFields');
    try {
      return super.cleanFields();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
description: ${description},
failure: ${failure},
homeState: ${homeState},
tasksList: ${tasksList}
    ''';
  }
}
