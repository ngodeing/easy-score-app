// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnswersStruct extends FFFirebaseStruct {
  AnswersStruct({
    String? answerText,
    DocumentReference? questionId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _answerText = answerText,
        _questionId = questionId,
        super(firestoreUtilData);

  // "answerText" field.
  String? _answerText;
  String get answerText => _answerText ?? '';
  set answerText(String? val) => _answerText = val;

  bool hasAnswerText() => _answerText != null;

  // "questionId" field.
  DocumentReference? _questionId;
  DocumentReference? get questionId => _questionId;
  set questionId(DocumentReference? val) => _questionId = val;

  bool hasQuestionId() => _questionId != null;

  static AnswersStruct fromMap(Map<String, dynamic> data) => AnswersStruct(
        answerText: data['answerText'] as String?,
        questionId: data['questionId'] as DocumentReference?,
      );

  static AnswersStruct? maybeFromMap(dynamic data) =>
      data is Map ? AnswersStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'answerText': _answerText,
        'questionId': _questionId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'answerText': serializeParam(
          _answerText,
          ParamType.String,
        ),
        'questionId': serializeParam(
          _questionId,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static AnswersStruct fromSerializableMap(Map<String, dynamic> data) =>
      AnswersStruct(
        answerText: deserializeParam(
          data['answerText'],
          ParamType.String,
          false,
        ),
        questionId: deserializeParam(
          data['questionId'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['questions'],
        ),
      );

  @override
  String toString() => 'AnswersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AnswersStruct &&
        answerText == other.answerText &&
        questionId == other.questionId;
  }

  @override
  int get hashCode => const ListEquality().hash([answerText, questionId]);
}

AnswersStruct createAnswersStruct({
  String? answerText,
  DocumentReference? questionId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AnswersStruct(
      answerText: answerText,
      questionId: questionId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AnswersStruct? updateAnswersStruct(
  AnswersStruct? answers, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    answers
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAnswersStructData(
  Map<String, dynamic> firestoreData,
  AnswersStruct? answers,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (answers == null) {
    return;
  }
  if (answers.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && answers.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final answersData = getAnswersFirestoreData(answers, forFieldValue);
  final nestedData = answersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = answers.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAnswersFirestoreData(
  AnswersStruct? answers, [
  bool forFieldValue = false,
]) {
  if (answers == null) {
    return {};
  }
  final firestoreData = mapToFirestore(answers.toMap());

  // Add any Firestore field values
  answers.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAnswersListFirestoreData(
  List<AnswersStruct>? answerss,
) =>
    answerss?.map((e) => getAnswersFirestoreData(e, true)).toList() ?? [];
