import 'package:list_curitiba/core/errors/failures.dart';

class TasksFailure extends Failure {
  final String title;
  final String message;
  TasksFailure({
    required this.title,
    required this.message,
  });
}
