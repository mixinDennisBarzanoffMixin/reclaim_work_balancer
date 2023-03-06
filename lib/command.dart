import 'package:flutter/rendering.dart';

import 'models/grpc/reclaim_task.pb.dart';
import 'services/reclaim_task_service.dart';

abstract class Command {
  final Task task;

  Command(this.task);

  Future<void> operation(ReclaimTaskService service);

  @override
  String toString() {
    return '$runtimeType { task: ${task.toString()} }';
  }
}


class EditCommand extends Command {
  EditCommand(super.task);
  
  @override
  Future<void> operation(ReclaimTaskService service) {
    return service.updateTask(task);
  }
  @override
  bool operator==(Object other) {
    if (other is EditCommand) {
      return other.task == task;
    }
    return false;
  }
  
  @override
  int get hashCode => Object.hashAll([runtimeType.hashCode, task.hashCode]);
}

class DeleteCommand extends Command {
  DeleteCommand(super.task);

  @override
  Future<void> operation(ReclaimTaskService service) {
    return service.deleteTask(task.id.toString());
  }
  @override
  bool operator==(Object other) {
    if (other is DeleteCommand) {
      return other.task == task;
    }
    return false;
  }
  
  @override
  int get hashCode => Object.hashAll([runtimeType.hashCode, task.hashCode]);
}

class CreateCommand extends Command {
  CreateCommand(super.task);

  @override
  Future<void> operation(ReclaimTaskService service) {
    return service.createTask(task);
  }
  @override
  bool operator==(Object other) {
    if (other is CreateCommand) {
      return other.task == task;
    }
    return false;
  }
  
  @override
  int get hashCode => Object.hashAll([runtimeType.hashCode, task.hashCode]);
}
