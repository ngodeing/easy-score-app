// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionsStruct extends FFFirebaseStruct {
  QuestionsStruct({
    String? uid,
    String? text,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _uid = uid,
        _text = text,
        super(firestoreUtilData);

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  static QuestionsStruct fromMap(Map<String, dynamic> data) => QuestionsStruct(
        uid: data['uid'] as String?,
        text: data['text'] as String?,
      );

  static QuestionsStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'uid': _uid,
        'text': _text,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuestionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionsStruct(
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuestionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuestionsStruct && uid == other.uid && text == other.text;
  }

  @override
  int get hashCode => const ListEquality().hash([uid, text]);
}

QuestionsStruct createQuestionsStruct({
  String? uid,
  String? text,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuestionsStruct(
      uid: uid,
      text: text,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuestionsStruct? updateQuestionsStruct(
  QuestionsStruct? questions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    questions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuestionsStructData(
  Map<String, dynamic> firestoreData,
  QuestionsStruct? questions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (questions == null) {
    return;
  }
  if (questions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && questions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final questionsData = getQuestionsFirestoreData(questions, forFieldValue);
  final nestedData = questionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = questions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuestionsFirestoreData(
  QuestionsStruct? questions, [
  bool forFieldValue = false,
]) {
  if (questions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(questions.toMap());

  // Add any Firestore field values
  questions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuestionsListFirestoreData(
  List<QuestionsStruct>? questionss,
) =>
    questionss?.map((e) => getQuestionsFirestoreData(e, true)).toList() ?? [];
