// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsageStruct extends FFFirebaseStruct {
  UsageStruct({
    int? promptTokens,
    int? completionTokens,
    int? totalTokens,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _promptTokens = promptTokens,
        _completionTokens = completionTokens,
        _totalTokens = totalTokens,
        super(firestoreUtilData);

  // "prompt_tokens" field.
  int? _promptTokens;
  int get promptTokens => _promptTokens ?? 0;
  set promptTokens(int? val) => _promptTokens = val;

  void incrementPromptTokens(int amount) =>
      promptTokens = promptTokens + amount;

  bool hasPromptTokens() => _promptTokens != null;

  // "completion_tokens" field.
  int? _completionTokens;
  int get completionTokens => _completionTokens ?? 0;
  set completionTokens(int? val) => _completionTokens = val;

  void incrementCompletionTokens(int amount) =>
      completionTokens = completionTokens + amount;

  bool hasCompletionTokens() => _completionTokens != null;

  // "total_tokens" field.
  int? _totalTokens;
  int get totalTokens => _totalTokens ?? 0;
  set totalTokens(int? val) => _totalTokens = val;

  void incrementTotalTokens(int amount) => totalTokens = totalTokens + amount;

  bool hasTotalTokens() => _totalTokens != null;

  static UsageStruct fromMap(Map<String, dynamic> data) => UsageStruct(
        promptTokens: castToType<int>(data['prompt_tokens']),
        completionTokens: castToType<int>(data['completion_tokens']),
        totalTokens: castToType<int>(data['total_tokens']),
      );

  static UsageStruct? maybeFromMap(dynamic data) =>
      data is Map ? UsageStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'prompt_tokens': _promptTokens,
        'completion_tokens': _completionTokens,
        'total_tokens': _totalTokens,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'prompt_tokens': serializeParam(
          _promptTokens,
          ParamType.int,
        ),
        'completion_tokens': serializeParam(
          _completionTokens,
          ParamType.int,
        ),
        'total_tokens': serializeParam(
          _totalTokens,
          ParamType.int,
        ),
      }.withoutNulls;

  static UsageStruct fromSerializableMap(Map<String, dynamic> data) =>
      UsageStruct(
        promptTokens: deserializeParam(
          data['prompt_tokens'],
          ParamType.int,
          false,
        ),
        completionTokens: deserializeParam(
          data['completion_tokens'],
          ParamType.int,
          false,
        ),
        totalTokens: deserializeParam(
          data['total_tokens'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UsageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UsageStruct &&
        promptTokens == other.promptTokens &&
        completionTokens == other.completionTokens &&
        totalTokens == other.totalTokens;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([promptTokens, completionTokens, totalTokens]);
}

UsageStruct createUsageStruct({
  int? promptTokens,
  int? completionTokens,
  int? totalTokens,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UsageStruct(
      promptTokens: promptTokens,
      completionTokens: completionTokens,
      totalTokens: totalTokens,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UsageStruct? updateUsageStruct(
  UsageStruct? usage, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    usage
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUsageStructData(
  Map<String, dynamic> firestoreData,
  UsageStruct? usage,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (usage == null) {
    return;
  }
  if (usage.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && usage.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final usageData = getUsageFirestoreData(usage, forFieldValue);
  final nestedData = usageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = usage.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUsageFirestoreData(
  UsageStruct? usage, [
  bool forFieldValue = false,
]) {
  if (usage == null) {
    return {};
  }
  final firestoreData = mapToFirestore(usage.toMap());

  // Add any Firestore field values
  usage.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUsageListFirestoreData(
  List<UsageStruct>? usages,
) =>
    usages?.map((e) => getUsageFirestoreData(e, true)).toList() ?? [];
