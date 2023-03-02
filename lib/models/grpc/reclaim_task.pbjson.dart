///
//  Generated code. Do not modify.
//  source: reclaim_task.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use taskDescriptor instead')
const Task$json = const {
  '1': 'Task',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'notes', '3': 3, '4': 1, '5': 9, '10': 'notes'},
    const {'1': 'eventCategory', '3': 4, '4': 1, '5': 9, '10': 'eventCategory'},
    const {'1': 'eventSubType', '3': 5, '4': 1, '5': 9, '10': 'eventSubType'},
    const {'1': 'status', '3': 6, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'timeChunksRequired', '3': 7, '4': 1, '5': 5, '10': 'timeChunksRequired'},
    const {'1': 'timeChunksSpent', '3': 8, '4': 1, '5': 5, '10': 'timeChunksSpent'},
    const {'1': 'timeChunksRemaining', '3': 9, '4': 1, '5': 5, '10': 'timeChunksRemaining'},
    const {'1': 'minChunkSize', '3': 10, '4': 1, '5': 5, '10': 'minChunkSize'},
    const {'1': 'maxChunkSize', '3': 11, '4': 1, '5': 5, '10': 'maxChunkSize'},
    const {'1': 'alwaysPrivate', '3': 12, '4': 1, '5': 8, '10': 'alwaysPrivate'},
    const {'1': 'deleted', '3': 13, '4': 1, '5': 8, '10': 'deleted'},
    const {'1': 'index', '3': 14, '4': 1, '5': 2, '10': 'index'},
    const {'1': 'due', '3': 15, '4': 1, '5': 9, '10': 'due'},
    const {'1': 'created', '3': 16, '4': 1, '5': 9, '10': 'created'},
    const {'1': 'updated', '3': 17, '4': 1, '5': 9, '10': 'updated'},
    const {'1': 'snoozeUntil', '3': 18, '4': 1, '5': 9, '10': 'snoozeUntil'},
    const {'1': 'adjusted', '3': 19, '4': 1, '5': 8, '10': 'adjusted'},
    const {'1': 'atRisk', '3': 20, '4': 1, '5': 8, '10': 'atRisk'},
    const {'1': 'type', '3': 21, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'recurringAssignmentType', '3': 22, '4': 1, '5': 9, '10': 'recurringAssignmentType'},
  ],
};

/// Descriptor for `Task`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskDescriptor = $convert.base64Decode('CgRUYXNrEg4KAmlkGAEgASgFUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSFAoFbm90ZXMYAyABKAlSBW5vdGVzEiQKDWV2ZW50Q2F0ZWdvcnkYBCABKAlSDWV2ZW50Q2F0ZWdvcnkSIgoMZXZlbnRTdWJUeXBlGAUgASgJUgxldmVudFN1YlR5cGUSFgoGc3RhdHVzGAYgASgJUgZzdGF0dXMSLgoSdGltZUNodW5rc1JlcXVpcmVkGAcgASgFUhJ0aW1lQ2h1bmtzUmVxdWlyZWQSKAoPdGltZUNodW5rc1NwZW50GAggASgFUg90aW1lQ2h1bmtzU3BlbnQSMAoTdGltZUNodW5rc1JlbWFpbmluZxgJIAEoBVITdGltZUNodW5rc1JlbWFpbmluZxIiCgxtaW5DaHVua1NpemUYCiABKAVSDG1pbkNodW5rU2l6ZRIiCgxtYXhDaHVua1NpemUYCyABKAVSDG1heENodW5rU2l6ZRIkCg1hbHdheXNQcml2YXRlGAwgASgIUg1hbHdheXNQcml2YXRlEhgKB2RlbGV0ZWQYDSABKAhSB2RlbGV0ZWQSFAoFaW5kZXgYDiABKAJSBWluZGV4EhAKA2R1ZRgPIAEoCVIDZHVlEhgKB2NyZWF0ZWQYECABKAlSB2NyZWF0ZWQSGAoHdXBkYXRlZBgRIAEoCVIHdXBkYXRlZBIgCgtzbm9vemVVbnRpbBgSIAEoCVILc25vb3plVW50aWwSGgoIYWRqdXN0ZWQYEyABKAhSCGFkanVzdGVkEhYKBmF0UmlzaxgUIAEoCFIGYXRSaXNrEhIKBHR5cGUYFSABKAlSBHR5cGUSOAoXcmVjdXJyaW5nQXNzaWdubWVudFR5cGUYFiABKAlSF3JlY3VycmluZ0Fzc2lnbm1lbnRUeXBl');
