// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChoicesStruct extends FFFirebaseStruct {
  ChoicesStruct({
    int? index,
    MessagesStruct? message,
    int? logprobs,
    String? finishReaseon,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _index = index,
        _message = message,
        _logprobs = logprobs,
        _finishReaseon = finishReaseon,
        super(firestoreUtilData);

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;

  void incrementIndex(int amount) => index = index + amount;

  bool hasIndex() => _index != null;

  // "message" field.
  MessagesStruct? _message;
  MessagesStruct get message => _message ?? MessagesStruct();
  set message(MessagesStruct? val) => _message = val;

  void updateMessage(Function(MessagesStruct) updateFn) {
    updateFn(_message ??= MessagesStruct());
  }

  bool hasMessage() => _message != null;

  // "logprobs" field.
  int? _logprobs;
  int get logprobs => _logprobs ?? 0;
  set logprobs(int? val) => _logprobs = val;

  void incrementLogprobs(int amount) => logprobs = logprobs + amount;

  bool hasLogprobs() => _logprobs != null;

  // "finish_reaseon" field.
  String? _finishReaseon;
  String get finishReaseon => _finishReaseon ?? '';
  set finishReaseon(String? val) => _finishReaseon = val;

  bool hasFinishReaseon() => _finishReaseon != null;

  static ChoicesStruct fromMap(Map<String, dynamic> data) => ChoicesStruct(
        index: castToType<int>(data['index']),
        message: MessagesStruct.maybeFromMap(data['message']),
        logprobs: castToType<int>(data['logprobs']),
        finishReaseon: data['finish_reaseon'] as String?,
      );

  static ChoicesStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChoicesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'index': _index,
        'message': _message?.toMap(),
        'logprobs': _logprobs,
        'finish_reaseon': _finishReaseon,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
        'message': serializeParam(
          _message,
          ParamType.DataStruct,
        ),
        'logprobs': serializeParam(
          _logprobs,
          ParamType.int,
        ),
        'finish_reaseon': serializeParam(
          _finishReaseon,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChoicesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChoicesStruct(
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
        message: deserializeStructParam(
          data['message'],
          ParamType.DataStruct,
          false,
          structBuilder: MessagesStruct.fromSerializableMap,
        ),
        logprobs: deserializeParam(
          data['logprobs'],
          ParamType.int,
          false,
        ),
        finishReaseon: deserializeParam(
          data['finish_reaseon'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChoicesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChoicesStruct &&
        index == other.index &&
        message == other.message &&
        logprobs == other.logprobs &&
        finishReaseon == other.finishReaseon;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([index, message, logprobs, finishReaseon]);
}

ChoicesStruct createChoicesStruct({
  int? index,
  MessagesStruct? message,
  int? logprobs,
  String? finishReaseon,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChoicesStruct(
      index: index,
      message: message ?? (clearUnsetFields ? MessagesStruct() : null),
      logprobs: logprobs,
      finishReaseon: finishReaseon,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChoicesStruct? updateChoicesStruct(
  ChoicesStruct? choices, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    choices
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChoicesStructData(
  Map<String, dynamic> firestoreData,
  ChoicesStruct? choices,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (choices == null) {
    return;
  }
  if (choices.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && choices.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final choicesData = getChoicesFirestoreData(choices, forFieldValue);
  final nestedData = choicesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = choices.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChoicesFirestoreData(
  ChoicesStruct? choices, [
  bool forFieldValue = false,
]) {
  if (choices == null) {
    return {};
  }
  final firestoreData = mapToFirestore(choices.toMap());

  // Handle nested data for "message" field.
  addMessagesStructData(
    firestoreData,
    choices.hasMessage() ? choices.message : null,
    'message',
    forFieldValue,
  );

  // Add any Firestore field values
  choices.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChoicesListFirestoreData(
  List<ChoicesStruct>? choicess,
) =>
    choicess?.map((e) => getChoicesFirestoreData(e, true)).toList() ?? [];
