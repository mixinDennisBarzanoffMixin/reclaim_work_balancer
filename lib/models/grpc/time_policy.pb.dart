///
//  Generated code. Do not modify.
//  source: time_policy.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TimePolicy_DayHours_Interval extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TimePolicy.DayHours.Interval', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'time_policy'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'start')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'end')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  TimePolicy_DayHours_Interval._() : super();
  factory TimePolicy_DayHours_Interval({
    $core.String? start,
    $core.String? end,
    $core.double? duration,
  }) {
    final _result = create();
    if (start != null) {
      _result.start = start;
    }
    if (end != null) {
      _result.end = end;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    return _result;
  }
  factory TimePolicy_DayHours_Interval.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TimePolicy_DayHours_Interval.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TimePolicy_DayHours_Interval clone() => TimePolicy_DayHours_Interval()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TimePolicy_DayHours_Interval copyWith(void Function(TimePolicy_DayHours_Interval) updates) => super.copyWith((message) => updates(message as TimePolicy_DayHours_Interval)) as TimePolicy_DayHours_Interval; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TimePolicy_DayHours_Interval create() => TimePolicy_DayHours_Interval._();
  TimePolicy_DayHours_Interval createEmptyInstance() => create();
  static $pb.PbList<TimePolicy_DayHours_Interval> createRepeated() => $pb.PbList<TimePolicy_DayHours_Interval>();
  @$core.pragma('dart2js:noInline')
  static TimePolicy_DayHours_Interval getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimePolicy_DayHours_Interval>(create);
  static TimePolicy_DayHours_Interval? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get start => $_getSZ(0);
  @$pb.TagNumber(1)
  set start($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStart() => $_has(0);
  @$pb.TagNumber(1)
  void clearStart() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get end => $_getSZ(1);
  @$pb.TagNumber(2)
  set end($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEnd() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnd() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get duration => $_getN(2);
  @$pb.TagNumber(3)
  set duration($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuration() => clearField(3);
}

class TimePolicy_DayHours extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TimePolicy.DayHours', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'time_policy'), createEmptyInstance: create)
    ..m<$core.String, TimePolicy_DayHours_Interval>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'intervals', entryClassName: 'TimePolicy.DayHours.IntervalsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: TimePolicy_DayHours_Interval.create, packageName: const $pb.PackageName('time_policy'))
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endOfDay')
    ..hasRequiredFields = false
  ;

  TimePolicy_DayHours._() : super();
  factory TimePolicy_DayHours({
    $core.Map<$core.String, TimePolicy_DayHours_Interval>? intervals,
    $core.String? endOfDay,
  }) {
    final _result = create();
    if (intervals != null) {
      _result.intervals.addAll(intervals);
    }
    if (endOfDay != null) {
      _result.endOfDay = endOfDay;
    }
    return _result;
  }
  factory TimePolicy_DayHours.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TimePolicy_DayHours.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TimePolicy_DayHours clone() => TimePolicy_DayHours()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TimePolicy_DayHours copyWith(void Function(TimePolicy_DayHours) updates) => super.copyWith((message) => updates(message as TimePolicy_DayHours)) as TimePolicy_DayHours; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TimePolicy_DayHours create() => TimePolicy_DayHours._();
  TimePolicy_DayHours createEmptyInstance() => create();
  static $pb.PbList<TimePolicy_DayHours> createRepeated() => $pb.PbList<TimePolicy_DayHours>();
  @$core.pragma('dart2js:noInline')
  static TimePolicy_DayHours getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimePolicy_DayHours>(create);
  static TimePolicy_DayHours? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, TimePolicy_DayHours_Interval> get intervals => $_getMap(0);

  @$pb.TagNumber(2)
  $core.String get endOfDay => $_getSZ(1);
  @$pb.TagNumber(2)
  set endOfDay($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEndOfDay() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndOfDay() => clearField(2);
}

class TimePolicy_DayHoursMap extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TimePolicy.DayHoursMap', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'time_policy'), createEmptyInstance: create)
    ..m<$core.String, TimePolicy_DayHours>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dayHours', entryClassName: 'TimePolicy.DayHoursMap.DayHoursEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: TimePolicy_DayHours.create, packageName: const $pb.PackageName('time_policy'))
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startOfWeek')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endOfWeek')
    ..hasRequiredFields = false
  ;

  TimePolicy_DayHoursMap._() : super();
  factory TimePolicy_DayHoursMap({
    $core.Map<$core.String, TimePolicy_DayHours>? dayHours,
    $core.String? startOfWeek,
    $core.String? endOfWeek,
  }) {
    final _result = create();
    if (dayHours != null) {
      _result.dayHours.addAll(dayHours);
    }
    if (startOfWeek != null) {
      _result.startOfWeek = startOfWeek;
    }
    if (endOfWeek != null) {
      _result.endOfWeek = endOfWeek;
    }
    return _result;
  }
  factory TimePolicy_DayHoursMap.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TimePolicy_DayHoursMap.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TimePolicy_DayHoursMap clone() => TimePolicy_DayHoursMap()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TimePolicy_DayHoursMap copyWith(void Function(TimePolicy_DayHoursMap) updates) => super.copyWith((message) => updates(message as TimePolicy_DayHoursMap)) as TimePolicy_DayHoursMap; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TimePolicy_DayHoursMap create() => TimePolicy_DayHoursMap._();
  TimePolicy_DayHoursMap createEmptyInstance() => create();
  static $pb.PbList<TimePolicy_DayHoursMap> createRepeated() => $pb.PbList<TimePolicy_DayHoursMap>();
  @$core.pragma('dart2js:noInline')
  static TimePolicy_DayHoursMap getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimePolicy_DayHoursMap>(create);
  static TimePolicy_DayHoursMap? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, TimePolicy_DayHours> get dayHours => $_getMap(0);

  @$pb.TagNumber(2)
  $core.String get startOfWeek => $_getSZ(1);
  @$pb.TagNumber(2)
  set startOfWeek($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStartOfWeek() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartOfWeek() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get endOfWeek => $_getSZ(2);
  @$pb.TagNumber(3)
  set endOfWeek($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEndOfWeek() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndOfWeek() => clearField(3);
}

class TimePolicy extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TimePolicy', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'time_policy'), createEmptyInstance: create)
    ..m<$core.String, TimePolicy_DayHoursMap>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timePolicies', entryClassName: 'TimePolicy.TimePoliciesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: TimePolicy_DayHoursMap.create, packageName: const $pb.PackageName('time_policy'))
    ..hasRequiredFields = false
  ;

  TimePolicy._() : super();
  factory TimePolicy({
    $core.Map<$core.String, TimePolicy_DayHoursMap>? timePolicies,
  }) {
    final _result = create();
    if (timePolicies != null) {
      _result.timePolicies.addAll(timePolicies);
    }
    return _result;
  }
  factory TimePolicy.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TimePolicy.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TimePolicy clone() => TimePolicy()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TimePolicy copyWith(void Function(TimePolicy) updates) => super.copyWith((message) => updates(message as TimePolicy)) as TimePolicy; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TimePolicy create() => TimePolicy._();
  TimePolicy createEmptyInstance() => create();
  static $pb.PbList<TimePolicy> createRepeated() => $pb.PbList<TimePolicy>();
  @$core.pragma('dart2js:noInline')
  static TimePolicy getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimePolicy>(create);
  static TimePolicy? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, TimePolicy_DayHoursMap> get timePolicies => $_getMap(0);
}

