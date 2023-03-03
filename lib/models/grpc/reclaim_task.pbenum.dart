///
//  Generated code. Do not modify.
//  source: reclaim_task.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class EventCategory extends $pb.ProtobufEnum {
  static const EventCategory WORK = EventCategory._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WORK');
  static const EventCategory PERSONAL = EventCategory._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PERSONAL');

  static const $core.List<EventCategory> values = <EventCategory> [
    WORK,
    PERSONAL,
  ];

  static final $core.Map<$core.int, EventCategory> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EventCategory? valueOf($core.int value) => _byValue[value];

  const EventCategory._($core.int v, $core.String n) : super(v, n);
}

class TaskStatus extends $pb.ProtobufEnum {
  static const TaskStatus UNKNOWN_STATUS = TaskStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_STATUS');
  static const TaskStatus SCHEDULED = TaskStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SCHEDULED');
  static const TaskStatus IN_PROGRESS = TaskStatus._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IN_PROGRESS');
  static const TaskStatus COMPLETED = TaskStatus._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMPLETED');
  static const TaskStatus NEW = TaskStatus._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NEW');

  static const $core.List<TaskStatus> values = <TaskStatus> [
    UNKNOWN_STATUS,
    SCHEDULED,
    IN_PROGRESS,
    COMPLETED,
    NEW,
  ];

  static final $core.Map<$core.int, TaskStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TaskStatus? valueOf($core.int value) => _byValue[value];

  const TaskStatus._($core.int v, $core.String n) : super(v, n);
}

class TaskType extends $pb.ProtobufEnum {
  static const TaskType UNKNOWN_TYPE = TaskType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_TYPE');
  static const TaskType TASK = TaskType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TASK');
  static const TaskType HABIT = TaskType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HABIT');
  static const TaskType DAILY = TaskType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DAILY');

  static const $core.List<TaskType> values = <TaskType> [
    UNKNOWN_TYPE,
    TASK,
    HABIT,
    DAILY,
  ];

  static final $core.Map<$core.int, TaskType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TaskType? valueOf($core.int value) => _byValue[value];

  const TaskType._($core.int v, $core.String n) : super(v, n);
}

