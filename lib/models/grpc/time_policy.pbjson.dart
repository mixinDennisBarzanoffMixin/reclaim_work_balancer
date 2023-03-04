///
//  Generated code. Do not modify.
//  source: time_policy.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use mapFieldEntryDescriptor instead')
const MapFieldEntry$json = const {
  '1': 'MapFieldEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.time_policy.DayHoursMap', '10': 'value'},
  ],
};

/// Descriptor for `MapFieldEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mapFieldEntryDescriptor = $convert.base64Decode('Cg1NYXBGaWVsZEVudHJ5EhAKA2tleRgBIAEoCVIDa2V5Ei4KBXZhbHVlGAIgASgLMhgudGltZV9wb2xpY3kuRGF5SG91cnNNYXBSBXZhbHVl');
@$core.Deprecated('Use dayHoursDescriptor instead')
const DayHours$json = const {
  '1': 'DayHours',
  '2': const [
    const {'1': 'intervals', '3': 1, '4': 3, '5': 11, '6': '.time_policy.DayHours.Interval', '10': 'intervals'},
    const {'1': 'end_of_day', '3': 2, '4': 1, '5': 9, '10': 'endOfDay'},
  ],
  '3': const [DayHours_Interval$json],
};

@$core.Deprecated('Use dayHoursDescriptor instead')
const DayHours_Interval$json = const {
  '1': 'Interval',
  '2': const [
    const {'1': 'start', '3': 1, '4': 1, '5': 9, '10': 'start'},
    const {'1': 'end', '3': 2, '4': 1, '5': 9, '10': 'end'},
    const {'1': 'duration', '3': 3, '4': 1, '5': 1, '10': 'duration'},
  ],
};

/// Descriptor for `DayHours`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dayHoursDescriptor = $convert.base64Decode('CghEYXlIb3VycxI8CglpbnRlcnZhbHMYASADKAsyHi50aW1lX3BvbGljeS5EYXlIb3Vycy5JbnRlcnZhbFIJaW50ZXJ2YWxzEhwKCmVuZF9vZl9kYXkYAiABKAlSCGVuZE9mRGF5Gk4KCEludGVydmFsEhQKBXN0YXJ0GAEgASgJUgVzdGFydBIQCgNlbmQYAiABKAlSA2VuZBIaCghkdXJhdGlvbhgDIAEoAVIIZHVyYXRpb24=');
@$core.Deprecated('Use dayHoursMapDescriptor instead')
const DayHoursMap$json = const {
  '1': 'DayHoursMap',
  '2': const [
    const {'1': 'day_hours', '3': 1, '4': 3, '5': 11, '6': '.time_policy.DayHoursMap.DayHoursEntry', '10': 'dayHours'},
    const {'1': 'start_of_week', '3': 2, '4': 1, '5': 9, '10': 'startOfWeek'},
    const {'1': 'end_of_week', '3': 3, '4': 1, '5': 9, '10': 'endOfWeek'},
  ],
  '3': const [DayHoursMap_DayHoursEntry$json],
};

@$core.Deprecated('Use dayHoursMapDescriptor instead')
const DayHoursMap_DayHoursEntry$json = const {
  '1': 'DayHoursEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.time_policy.DayHours', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `DayHoursMap`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dayHoursMapDescriptor = $convert.base64Decode('CgtEYXlIb3Vyc01hcBJDCglkYXlfaG91cnMYASADKAsyJi50aW1lX3BvbGljeS5EYXlIb3Vyc01hcC5EYXlIb3Vyc0VudHJ5UghkYXlIb3VycxIiCg1zdGFydF9vZl93ZWVrGAIgASgJUgtzdGFydE9mV2VlaxIeCgtlbmRfb2Zfd2VlaxgDIAEoCVIJZW5kT2ZXZWVrGlIKDURheUhvdXJzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSKwoFdmFsdWUYAiABKAsyFS50aW1lX3BvbGljeS5EYXlIb3Vyc1IFdmFsdWU6AjgB');
@$core.Deprecated('Use timePolicyDescriptor instead')
const TimePolicy$json = const {
  '1': 'TimePolicy',
  '2': const [
    const {'1': 'work', '3': 1, '4': 1, '5': 11, '6': '.time_policy.DayHoursMap', '10': 'WORK'},
    const {'1': 'personal', '3': 2, '4': 1, '5': 11, '6': '.time_policy.DayHoursMap', '10': 'PERSONAL'},
    const {'1': 'meeting', '3': 3, '4': 1, '5': 11, '6': '.time_policy.DayHoursMap', '10': 'MEETING'},
  ],
};

/// Descriptor for `TimePolicy`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timePolicyDescriptor = $convert.base64Decode('CgpUaW1lUG9saWN5EiwKBHdvcmsYASABKAsyGC50aW1lX3BvbGljeS5EYXlIb3Vyc01hcFIEV09SSxI0CghwZXJzb25hbBgCIAEoCzIYLnRpbWVfcG9saWN5LkRheUhvdXJzTWFwUghQRVJTT05BTBIyCgdtZWV0aW5nGAMgASgLMhgudGltZV9wb2xpY3kuRGF5SG91cnNNYXBSB01FRVRJTkc=');
