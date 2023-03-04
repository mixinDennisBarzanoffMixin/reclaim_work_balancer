///
//  Generated code. Do not modify.
//  source: time_policy.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MapFieldEntry extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MapFieldEntry', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'time_policy'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key')
    ..aOM<DayHoursMap>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', subBuilder: DayHoursMap.create)
    ..hasRequiredFields = false
  ;

  MapFieldEntry._() : super();
  factory MapFieldEntry({
    $core.String? key,
    DayHoursMap? value,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory MapFieldEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MapFieldEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MapFieldEntry clone() => MapFieldEntry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MapFieldEntry copyWith(void Function(MapFieldEntry) updates) => super.copyWith((message) => updates(message as MapFieldEntry)) as MapFieldEntry; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MapFieldEntry create() => MapFieldEntry._();
  MapFieldEntry createEmptyInstance() => create();
  static $pb.PbList<MapFieldEntry> createRepeated() => $pb.PbList<MapFieldEntry>();
  @$core.pragma('dart2js:noInline')
  static MapFieldEntry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MapFieldEntry>(create);
  static MapFieldEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  DayHoursMap get value => $_getN(1);
  @$pb.TagNumber(2)
  set value(DayHoursMap v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
  @$pb.TagNumber(2)
  DayHoursMap ensureValue() => $_ensure(1);
}

class DayHours_Interval extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DayHours.Interval', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'time_policy'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'start')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'end')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  DayHours_Interval._() : super();
  factory DayHours_Interval({
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
  factory DayHours_Interval.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DayHours_Interval.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DayHours_Interval clone() => DayHours_Interval()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DayHours_Interval copyWith(void Function(DayHours_Interval) updates) => super.copyWith((message) => updates(message as DayHours_Interval)) as DayHours_Interval; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DayHours_Interval create() => DayHours_Interval._();
  DayHours_Interval createEmptyInstance() => create();
  static $pb.PbList<DayHours_Interval> createRepeated() => $pb.PbList<DayHours_Interval>();
  @$core.pragma('dart2js:noInline')
  static DayHours_Interval getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DayHours_Interval>(create);
  static DayHours_Interval? _defaultInstance;

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

class DayHours extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DayHours', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'time_policy'), createEmptyInstance: create)
    ..pc<DayHours_Interval>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'intervals', $pb.PbFieldType.PM, subBuilder: DayHours_Interval.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endOfDay')
    ..hasRequiredFields = false
  ;

  DayHours._() : super();
  factory DayHours({
    $core.Iterable<DayHours_Interval>? intervals,
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
  factory DayHours.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DayHours.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DayHours clone() => DayHours()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DayHours copyWith(void Function(DayHours) updates) => super.copyWith((message) => updates(message as DayHours)) as DayHours; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DayHours create() => DayHours._();
  DayHours createEmptyInstance() => create();
  static $pb.PbList<DayHours> createRepeated() => $pb.PbList<DayHours>();
  @$core.pragma('dart2js:noInline')
  static DayHours getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DayHours>(create);
  static DayHours? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<DayHours_Interval> get intervals => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get endOfDay => $_getSZ(1);
  @$pb.TagNumber(2)
  set endOfDay($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEndOfDay() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndOfDay() => clearField(2);
}

class DayHoursMap extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DayHoursMap', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'time_policy'), createEmptyInstance: create)
    ..m<$core.String, DayHours>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dayHours', entryClassName: 'DayHoursMap.DayHoursEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: DayHours.create, packageName: const $pb.PackageName('time_policy'))
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startOfWeek')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endOfWeek')
    ..hasRequiredFields = false
  ;

  DayHoursMap._() : super();
  factory DayHoursMap({
    $core.Map<$core.String, DayHours>? dayHours,
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
  factory DayHoursMap.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DayHoursMap.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DayHoursMap clone() => DayHoursMap()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DayHoursMap copyWith(void Function(DayHoursMap) updates) => super.copyWith((message) => updates(message as DayHoursMap)) as DayHoursMap; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DayHoursMap create() => DayHoursMap._();
  DayHoursMap createEmptyInstance() => create();
  static $pb.PbList<DayHoursMap> createRepeated() => $pb.PbList<DayHoursMap>();
  @$core.pragma('dart2js:noInline')
  static DayHoursMap getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DayHoursMap>(create);
  static DayHoursMap? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, DayHours> get dayHours => $_getMap(0);

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
    ..aOM<DayHoursMap>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'WORK', protoName: 'work', subBuilder: DayHoursMap.create)
    ..aOM<DayHoursMap>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PERSONAL', protoName: 'personal', subBuilder: DayHoursMap.create)
    ..aOM<DayHoursMap>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'MEETING', protoName: 'meeting', subBuilder: DayHoursMap.create)
    ..hasRequiredFields = false
  ;

  TimePolicy._() : super();
  factory TimePolicy({
    DayHoursMap? work,
    DayHoursMap? personal,
    DayHoursMap? meeting,
  }) {
    final _result = create();
    if (work != null) {
      _result.work = work;
    }
    if (personal != null) {
      _result.personal = personal;
    }
    if (meeting != null) {
      _result.meeting = meeting;
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
  DayHoursMap get work => $_getN(0);
  @$pb.TagNumber(1)
  set work(DayHoursMap v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasWork() => $_has(0);
  @$pb.TagNumber(1)
  void clearWork() => clearField(1);
  @$pb.TagNumber(1)
  DayHoursMap ensureWork() => $_ensure(0);

  @$pb.TagNumber(2)
  DayHoursMap get personal => $_getN(1);
  @$pb.TagNumber(2)
  set personal(DayHoursMap v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPersonal() => $_has(1);
  @$pb.TagNumber(2)
  void clearPersonal() => clearField(2);
  @$pb.TagNumber(2)
  DayHoursMap ensurePersonal() => $_ensure(1);

  @$pb.TagNumber(3)
  DayHoursMap get meeting => $_getN(2);
  @$pb.TagNumber(3)
  set meeting(DayHoursMap v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasMeeting() => $_has(2);
  @$pb.TagNumber(3)
  void clearMeeting() => clearField(3);
  @$pb.TagNumber(3)
  DayHoursMap ensureMeeting() => $_ensure(2);
}

