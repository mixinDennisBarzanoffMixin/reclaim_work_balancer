///
//  Generated code. Do not modify.
//  source: reclaim_task.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Task extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Task', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'task'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventCategory', protoName: 'eventCategory')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventSubType', protoName: 'eventSubType')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timeChunksRequired', $pb.PbFieldType.O3, protoName: 'timeChunksRequired')
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timeChunksSpent', $pb.PbFieldType.O3, protoName: 'timeChunksSpent')
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timeChunksRemaining', $pb.PbFieldType.O3, protoName: 'timeChunksRemaining')
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minChunkSize', $pb.PbFieldType.O3, protoName: 'minChunkSize')
    ..a<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxChunkSize', $pb.PbFieldType.O3, protoName: 'maxChunkSize')
    ..aOB(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'alwaysPrivate', protoName: 'alwaysPrivate')
    ..aOB(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deleted')
    ..a<$core.double>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'index', $pb.PbFieldType.OF)
    ..aOS(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'due')
    ..aOS(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'created')
    ..aOS(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updated')
    ..aOS(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'snoozeUntil', protoName: 'snoozeUntil')
    ..aOB(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'adjusted')
    ..aOB(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'atRisk', protoName: 'atRisk')
    ..aOS(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type')
    ..aOS(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'recurringAssignmentType', protoName: 'recurringAssignmentType')
    ..hasRequiredFields = false
  ;

  Task._() : super();
  factory Task({
    $core.int? id,
    $core.String? title,
    $core.String? notes,
    $core.String? eventCategory,
    $core.String? eventSubType,
    $core.String? status,
    $core.int? timeChunksRequired,
    $core.int? timeChunksSpent,
    $core.int? timeChunksRemaining,
    $core.int? minChunkSize,
    $core.int? maxChunkSize,
    $core.bool? alwaysPrivate,
    $core.bool? deleted,
    $core.double? index,
    $core.String? due,
    $core.String? created,
    $core.String? updated,
    $core.String? snoozeUntil,
    $core.bool? adjusted,
    $core.bool? atRisk,
    $core.String? type,
    $core.String? recurringAssignmentType,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (notes != null) {
      _result.notes = notes;
    }
    if (eventCategory != null) {
      _result.eventCategory = eventCategory;
    }
    if (eventSubType != null) {
      _result.eventSubType = eventSubType;
    }
    if (status != null) {
      _result.status = status;
    }
    if (timeChunksRequired != null) {
      _result.timeChunksRequired = timeChunksRequired;
    }
    if (timeChunksSpent != null) {
      _result.timeChunksSpent = timeChunksSpent;
    }
    if (timeChunksRemaining != null) {
      _result.timeChunksRemaining = timeChunksRemaining;
    }
    if (minChunkSize != null) {
      _result.minChunkSize = minChunkSize;
    }
    if (maxChunkSize != null) {
      _result.maxChunkSize = maxChunkSize;
    }
    if (alwaysPrivate != null) {
      _result.alwaysPrivate = alwaysPrivate;
    }
    if (deleted != null) {
      _result.deleted = deleted;
    }
    if (index != null) {
      _result.index = index;
    }
    if (due != null) {
      _result.due = due;
    }
    if (created != null) {
      _result.created = created;
    }
    if (updated != null) {
      _result.updated = updated;
    }
    if (snoozeUntil != null) {
      _result.snoozeUntil = snoozeUntil;
    }
    if (adjusted != null) {
      _result.adjusted = adjusted;
    }
    if (atRisk != null) {
      _result.atRisk = atRisk;
    }
    if (type != null) {
      _result.type = type;
    }
    if (recurringAssignmentType != null) {
      _result.recurringAssignmentType = recurringAssignmentType;
    }
    return _result;
  }
  factory Task.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Task.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Task clone() => Task()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Task copyWith(void Function(Task) updates) => super.copyWith((message) => updates(message as Task)) as Task; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Task create() => Task._();
  Task createEmptyInstance() => create();
  static $pb.PbList<Task> createRepeated() => $pb.PbList<Task>();
  @$core.pragma('dart2js:noInline')
  static Task getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Task>(create);
  static Task? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get notes => $_getSZ(2);
  @$pb.TagNumber(3)
  set notes($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNotes() => $_has(2);
  @$pb.TagNumber(3)
  void clearNotes() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get eventCategory => $_getSZ(3);
  @$pb.TagNumber(4)
  set eventCategory($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEventCategory() => $_has(3);
  @$pb.TagNumber(4)
  void clearEventCategory() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get eventSubType => $_getSZ(4);
  @$pb.TagNumber(5)
  set eventSubType($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEventSubType() => $_has(4);
  @$pb.TagNumber(5)
  void clearEventSubType() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get status => $_getSZ(5);
  @$pb.TagNumber(6)
  set status($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get timeChunksRequired => $_getIZ(6);
  @$pb.TagNumber(7)
  set timeChunksRequired($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTimeChunksRequired() => $_has(6);
  @$pb.TagNumber(7)
  void clearTimeChunksRequired() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get timeChunksSpent => $_getIZ(7);
  @$pb.TagNumber(8)
  set timeChunksSpent($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTimeChunksSpent() => $_has(7);
  @$pb.TagNumber(8)
  void clearTimeChunksSpent() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get timeChunksRemaining => $_getIZ(8);
  @$pb.TagNumber(9)
  set timeChunksRemaining($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasTimeChunksRemaining() => $_has(8);
  @$pb.TagNumber(9)
  void clearTimeChunksRemaining() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get minChunkSize => $_getIZ(9);
  @$pb.TagNumber(10)
  set minChunkSize($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasMinChunkSize() => $_has(9);
  @$pb.TagNumber(10)
  void clearMinChunkSize() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get maxChunkSize => $_getIZ(10);
  @$pb.TagNumber(11)
  set maxChunkSize($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasMaxChunkSize() => $_has(10);
  @$pb.TagNumber(11)
  void clearMaxChunkSize() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get alwaysPrivate => $_getBF(11);
  @$pb.TagNumber(12)
  set alwaysPrivate($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasAlwaysPrivate() => $_has(11);
  @$pb.TagNumber(12)
  void clearAlwaysPrivate() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get deleted => $_getBF(12);
  @$pb.TagNumber(13)
  set deleted($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasDeleted() => $_has(12);
  @$pb.TagNumber(13)
  void clearDeleted() => clearField(13);

  @$pb.TagNumber(14)
  $core.double get index => $_getN(13);
  @$pb.TagNumber(14)
  set index($core.double v) { $_setFloat(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasIndex() => $_has(13);
  @$pb.TagNumber(14)
  void clearIndex() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get due => $_getSZ(14);
  @$pb.TagNumber(15)
  set due($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasDue() => $_has(14);
  @$pb.TagNumber(15)
  void clearDue() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get created => $_getSZ(15);
  @$pb.TagNumber(16)
  set created($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasCreated() => $_has(15);
  @$pb.TagNumber(16)
  void clearCreated() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get updated => $_getSZ(16);
  @$pb.TagNumber(17)
  set updated($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasUpdated() => $_has(16);
  @$pb.TagNumber(17)
  void clearUpdated() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get snoozeUntil => $_getSZ(17);
  @$pb.TagNumber(18)
  set snoozeUntil($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasSnoozeUntil() => $_has(17);
  @$pb.TagNumber(18)
  void clearSnoozeUntil() => clearField(18);

  @$pb.TagNumber(19)
  $core.bool get adjusted => $_getBF(18);
  @$pb.TagNumber(19)
  set adjusted($core.bool v) { $_setBool(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasAdjusted() => $_has(18);
  @$pb.TagNumber(19)
  void clearAdjusted() => clearField(19);

  @$pb.TagNumber(20)
  $core.bool get atRisk => $_getBF(19);
  @$pb.TagNumber(20)
  set atRisk($core.bool v) { $_setBool(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasAtRisk() => $_has(19);
  @$pb.TagNumber(20)
  void clearAtRisk() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get type => $_getSZ(20);
  @$pb.TagNumber(21)
  set type($core.String v) { $_setString(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasType() => $_has(20);
  @$pb.TagNumber(21)
  void clearType() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get recurringAssignmentType => $_getSZ(21);
  @$pb.TagNumber(22)
  set recurringAssignmentType($core.String v) { $_setString(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasRecurringAssignmentType() => $_has(21);
  @$pb.TagNumber(22)
  void clearRecurringAssignmentType() => clearField(22);
}

