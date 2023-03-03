///
//  Generated code. Do not modify.
//  source: reclaim_task.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use eventCategoryDescriptor instead')
const EventCategory$json = const {
  '1': 'EventCategory',
  '2': const [
    const {'1': 'WORK', '2': 0},
    const {'1': 'PERSONAL', '2': 1},
  ],
};

/// Descriptor for `EventCategory`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List eventCategoryDescriptor = $convert.base64Decode('Cg1FdmVudENhdGVnb3J5EggKBFdPUksQABIMCghQRVJTT05BTBAB');
@$core.Deprecated('Use taskStatusDescriptor instead')
const TaskStatus$json = const {
  '1': 'TaskStatus',
  '2': const [
    const {'1': 'UNKNOWN_STATUS', '2': 0},
    const {'1': 'SCHEDULED', '2': 1},
    const {'1': 'IN_PROGRESS', '2': 2},
    const {'1': 'COMPLETED', '2': 3},
    const {'1': 'NEW', '2': 4},
  ],
};

/// Descriptor for `TaskStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List taskStatusDescriptor = $convert.base64Decode('CgpUYXNrU3RhdHVzEhIKDlVOS05PV05fU1RBVFVTEAASDQoJU0NIRURVTEVEEAESDwoLSU5fUFJPR1JFU1MQAhINCglDT01QTEVURUQQAxIHCgNORVcQBA==');
@$core.Deprecated('Use taskTypeDescriptor instead')
const TaskType$json = const {
  '1': 'TaskType',
  '2': const [
    const {'1': 'UNKNOWN_TYPE', '2': 0},
    const {'1': 'TASK', '2': 1},
    const {'1': 'HABIT', '2': 2},
    const {'1': 'DAILY', '2': 3},
  ],
};

/// Descriptor for `TaskType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List taskTypeDescriptor = $convert.base64Decode('CghUYXNrVHlwZRIQCgxVTktOT1dOX1RZUEUQABIICgRUQVNLEAESCQoFSEFCSVQQAhIJCgVEQUlMWRAD');
@$core.Deprecated('Use taskDescriptor instead')
const Task$json = const {
  '1': 'Task',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'notes', '3': 3, '4': 1, '5': 9, '10': 'notes'},
    const {'1': 'eventCategory', '3': 4, '4': 1, '5': 14, '6': '.task.EventCategory', '10': 'eventCategory'},
    const {'1': 'eventSubType', '3': 5, '4': 1, '5': 9, '10': 'eventSubType'},
    const {'1': 'status', '3': 6, '4': 1, '5': 14, '6': '.task.TaskStatus', '10': 'status'},
    const {'1': 'timeChunksRequired', '3': 7, '4': 1, '5': 5, '10': 'timeChunksRequired'},
    const {'1': 'timeChunksSpent', '3': 8, '4': 1, '5': 5, '10': 'timeChunksSpent'},
    const {'1': 'timeChunksRemaining', '3': 9, '4': 1, '5': 5, '10': 'timeChunksRemaining'},
    const {'1': 'minChunkSize', '3': 10, '4': 1, '5': 5, '10': 'minChunkSize'},
    const {'1': 'maxChunkSize', '3': 11, '4': 1, '5': 5, '10': 'maxChunkSize'},
    const {'1': 'alwaysPrivate', '3': 12, '4': 1, '5': 8, '10': 'alwaysPrivate'},
    const {'1': 'deleted', '3': 13, '4': 1, '5': 8, '10': 'deleted'},
    const {'1': 'index', '3': 14, '4': 1, '5': 1, '10': 'index'},
    const {'1': 'due', '3': 15, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'due'},
    const {'1': 'created', '3': 16, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'created'},
    const {'1': 'updated', '3': 17, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updated'},
    const {'1': 'snoozeUntil', '3': 18, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'snoozeUntil'},
    const {'1': 'adjusted', '3': 19, '4': 1, '5': 8, '10': 'adjusted'},
    const {'1': 'atRisk', '3': 20, '4': 1, '5': 8, '10': 'atRisk'},
    const {'1': 'type', '3': 21, '4': 1, '5': 14, '6': '.task.TaskType', '10': 'type'},
    const {'1': 'recurringAssignmentType', '3': 22, '4': 1, '5': 14, '6': '.task.TaskType', '10': 'recurringAssignmentType'},
    const {'1': 'eventColor', '3': 23, '4': 1, '5': 9, '10': 'eventColor'},
    const {'1': 'instances', '3': 24, '4': 3, '5': 11, '6': '.task.TaskInstance', '10': 'instances'},
  ],
};

/// Descriptor for `Task`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskDescriptor = $convert.base64Decode('CgRUYXNrEg4KAmlkGAEgASgFUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSFAoFbm90ZXMYAyABKAlSBW5vdGVzEjkKDWV2ZW50Q2F0ZWdvcnkYBCABKA4yEy50YXNrLkV2ZW50Q2F0ZWdvcnlSDWV2ZW50Q2F0ZWdvcnkSIgoMZXZlbnRTdWJUeXBlGAUgASgJUgxldmVudFN1YlR5cGUSKAoGc3RhdHVzGAYgASgOMhAudGFzay5UYXNrU3RhdHVzUgZzdGF0dXMSLgoSdGltZUNodW5rc1JlcXVpcmVkGAcgASgFUhJ0aW1lQ2h1bmtzUmVxdWlyZWQSKAoPdGltZUNodW5rc1NwZW50GAggASgFUg90aW1lQ2h1bmtzU3BlbnQSMAoTdGltZUNodW5rc1JlbWFpbmluZxgJIAEoBVITdGltZUNodW5rc1JlbWFpbmluZxIiCgxtaW5DaHVua1NpemUYCiABKAVSDG1pbkNodW5rU2l6ZRIiCgxtYXhDaHVua1NpemUYCyABKAVSDG1heENodW5rU2l6ZRIkCg1hbHdheXNQcml2YXRlGAwgASgIUg1hbHdheXNQcml2YXRlEhgKB2RlbGV0ZWQYDSABKAhSB2RlbGV0ZWQSFAoFaW5kZXgYDiABKAFSBWluZGV4EiwKA2R1ZRgPIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSA2R1ZRI0CgdjcmVhdGVkGBAgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIHY3JlYXRlZBI0Cgd1cGRhdGVkGBEgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIHdXBkYXRlZBI8Cgtzbm9vemVVbnRpbBgSIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSC3Nub296ZVVudGlsEhoKCGFkanVzdGVkGBMgASgIUghhZGp1c3RlZBIWCgZhdFJpc2sYFCABKAhSBmF0UmlzaxIiCgR0eXBlGBUgASgOMg4udGFzay5UYXNrVHlwZVIEdHlwZRJIChdyZWN1cnJpbmdBc3NpZ25tZW50VHlwZRgWIAEoDjIOLnRhc2suVGFza1R5cGVSF3JlY3VycmluZ0Fzc2lnbm1lbnRUeXBlEh4KCmV2ZW50Q29sb3IYFyABKAlSCmV2ZW50Q29sb3ISMAoJaW5zdGFuY2VzGBggAygLMhIudGFzay5UYXNrSW5zdGFuY2VSCWluc3RhbmNlcw==');
@$core.Deprecated('Use taskInstanceDescriptor instead')
const TaskInstance$json = const {
  '1': 'TaskInstance',
  '2': const [
    const {'1': 'taskId', '3': 1, '4': 1, '5': 5, '10': 'taskId'},
    const {'1': 'eventId', '3': 2, '4': 1, '5': 9, '10': 'eventId'},
    const {'1': 'eventKey', '3': 3, '4': 1, '5': 9, '10': 'eventKey'},
    const {'1': 'status', '3': 4, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'start', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'start'},
    const {'1': 'end', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'end'},
    const {'1': 'index', '3': 7, '4': 1, '5': 5, '10': 'index'},
    const {'1': 'pinned', '3': 8, '4': 1, '5': 8, '10': 'pinned'},
  ],
};

/// Descriptor for `TaskInstance`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskInstanceDescriptor = $convert.base64Decode('CgxUYXNrSW5zdGFuY2USFgoGdGFza0lkGAEgASgFUgZ0YXNrSWQSGAoHZXZlbnRJZBgCIAEoCVIHZXZlbnRJZBIaCghldmVudEtleRgDIAEoCVIIZXZlbnRLZXkSFgoGc3RhdHVzGAQgASgJUgZzdGF0dXMSMAoFc3RhcnQYBSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgVzdGFydBIsCgNlbmQYBiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgNlbmQSFAoFaW5kZXgYByABKAVSBWluZGV4EhYKBnBpbm5lZBgIIAEoCFIGcGlubmVk');
