///
//  Generated code. Do not modify.
//  source: time_policy.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use timePolicyDescriptor instead')
const TimePolicy$json = const {
  '1': 'TimePolicy',
  '2': const [
    const {'1': 'time_policies', '3': 1, '4': 3, '5': 11, '6': '.time_policy.TimePolicy.TimePoliciesEntry', '10': 'timePolicies'},
  ],
  '3': const [TimePolicy_DayHours$json, TimePolicy_DayHoursMap$json, TimePolicy_TimePoliciesEntry$json],
};

@$core.Deprecated('Use timePolicyDescriptor instead')
const TimePolicy_DayHours$json = const {
  '1': 'DayHours',
  '2': const [
    const {'1': 'intervals', '3': 1, '4': 3, '5': 11, '6': '.time_policy.TimePolicy.DayHours.IntervalsEntry', '10': 'intervals'},
    const {'1': 'end_of_day', '3': 2, '4': 1, '5': 9, '10': 'endOfDay'},
  ],
  '3': const [TimePolicy_DayHours_Interval$json, TimePolicy_DayHours_IntervalsEntry$json],
};

@$core.Deprecated('Use timePolicyDescriptor instead')
const TimePolicy_DayHours_Interval$json = const {
  '1': 'Interval',
  '2': const [
    const {'1': 'start', '3': 1, '4': 1, '5': 9, '10': 'start'},
    const {'1': 'end', '3': 2, '4': 1, '5': 9, '10': 'end'},
    const {'1': 'duration', '3': 3, '4': 1, '5': 1, '10': 'duration'},
  ],
};

@$core.Deprecated('Use timePolicyDescriptor instead')
const TimePolicy_DayHours_IntervalsEntry$json = const {
  '1': 'IntervalsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.time_policy.TimePolicy.DayHours.Interval', '10': 'value'},
  ],
  '7': const {'7': true},
};

@$core.Deprecated('Use timePolicyDescriptor instead')
const TimePolicy_DayHoursMap$json = const {
  '1': 'DayHoursMap',
  '2': const [
    const {'1': 'day_hours', '3': 1, '4': 3, '5': 11, '6': '.time_policy.TimePolicy.DayHoursMap.DayHoursEntry', '10': 'dayHours'},
    const {'1': 'start_of_week', '3': 2, '4': 1, '5': 9, '10': 'startOfWeek'},
    const {'1': 'end_of_week', '3': 3, '4': 1, '5': 9, '10': 'endOfWeek'},
  ],
  '3': const [TimePolicy_DayHoursMap_DayHoursEntry$json],
};

@$core.Deprecated('Use timePolicyDescriptor instead')
const TimePolicy_DayHoursMap_DayHoursEntry$json = const {
  '1': 'DayHoursEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.time_policy.TimePolicy.DayHours', '10': 'value'},
  ],
  '7': const {'7': true},
};

@$core.Deprecated('Use timePolicyDescriptor instead')
const TimePolicy_TimePoliciesEntry$json = const {
  '1': 'TimePoliciesEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.time_policy.TimePolicy.DayHoursMap', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `TimePolicy`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timePolicyDescriptor = $convert.base64Decode('CgpUaW1lUG9saWN5Ek4KDXRpbWVfcG9saWNpZXMYASADKAsyKS50aW1lX3BvbGljeS5UaW1lUG9saWN5LlRpbWVQb2xpY2llc0VudHJ5Ugx0aW1lUG9saWNpZXMasAIKCERheUhvdXJzEk0KCWludGVydmFscxgBIAMoCzIvLnRpbWVfcG9saWN5LlRpbWVQb2xpY3kuRGF5SG91cnMuSW50ZXJ2YWxzRW50cnlSCWludGVydmFscxIcCgplbmRfb2ZfZGF5GAIgASgJUghlbmRPZkRheRpOCghJbnRlcnZhbBIUCgVzdGFydBgBIAEoCVIFc3RhcnQSEAoDZW5kGAIgASgJUgNlbmQSGgoIZHVyYXRpb24YAyABKAFSCGR1cmF0aW9uGmcKDkludGVydmFsc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5Ej8KBXZhbHVlGAIgASgLMikudGltZV9wb2xpY3kuVGltZVBvbGljeS5EYXlIb3Vycy5JbnRlcnZhbFIFdmFsdWU6AjgBGoACCgtEYXlIb3Vyc01hcBJOCglkYXlfaG91cnMYASADKAsyMS50aW1lX3BvbGljeS5UaW1lUG9saWN5LkRheUhvdXJzTWFwLkRheUhvdXJzRW50cnlSCGRheUhvdXJzEiIKDXN0YXJ0X29mX3dlZWsYAiABKAlSC3N0YXJ0T2ZXZWVrEh4KC2VuZF9vZl93ZWVrGAMgASgJUgllbmRPZldlZWsaXQoNRGF5SG91cnNFbnRyeRIQCgNrZXkYASABKAlSA2tleRI2CgV2YWx1ZRgCIAEoCzIgLnRpbWVfcG9saWN5LlRpbWVQb2xpY3kuRGF5SG91cnNSBXZhbHVlOgI4ARpkChFUaW1lUG9saWNpZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRI5CgV2YWx1ZRgCIAEoCzIjLnRpbWVfcG9saWN5LlRpbWVQb2xpY3kuRGF5SG91cnNNYXBSBXZhbHVlOgI4AQ==');
