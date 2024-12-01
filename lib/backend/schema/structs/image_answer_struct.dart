// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImageAnswerStruct extends FFFirebaseStruct {
  ImageAnswerStruct({
    String? imageAnswer,
    DocumentReference? questionId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _imageAnswer = imageAnswer,
        _questionId = questionId,
        super(firestoreUtilData);

  // "imageAnswer" field.
  String? _imageAnswer;
  String get imageAnswer => _imageAnswer ?? '';
  set imageAnswer(String? val) => _imageAnswer = val;

  bool hasImageAnswer() => _imageAnswer != null;

  // "questionId" field.
  DocumentReference? _questionId;
  DocumentReference? get questionId => _questionId;
  set questionId(DocumentReference? val) => _questionId = val;

  bool hasQuestionId() => _questionId != null;

  static ImageAnswerStruct fromMap(Map<String, dynamic> data) =>
      ImageAnswerStruct(
        imageAnswer: data['imageAnswer'] as String?,
        questionId: data['questionId'] as DocumentReference?,
      );

  static ImageAnswerStruct? maybeFromMap(dynamic data) => data is Map
      ? ImageAnswerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'imageAnswer': _imageAnswer,
        'questionId': _questionId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'imageAnswer': serializeParam(
          _imageAnswer,
          ParamType.String,
        ),
        'questionId': serializeParam(
          _questionId,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static ImageAnswerStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImageAnswerStruct(
        imageAnswer: deserializeParam(
          data['imageAnswer'],
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
  String toString() => 'ImageAnswerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImageAnswerStruct &&
        imageAnswer == other.imageAnswer &&
        questionId == other.questionId;
  }

  @override
  int get hashCode => const ListEquality().hash([imageAnswer, questionId]);
}

ImageAnswerStruct createImageAnswerStruct({
  String? imageAnswer,
  DocumentReference? questionId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImageAnswerStruct(
      imageAnswer: imageAnswer,
      questionId: questionId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImageAnswerStruct? updateImageAnswerStruct(
  ImageAnswerStruct? imageAnswerStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    imageAnswerStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImageAnswerStructData(
  Map<String, dynamic> firestoreData,
  ImageAnswerStruct? imageAnswerStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (imageAnswerStruct == null) {
    return;
  }
  if (imageAnswerStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && imageAnswerStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final imageAnswerStructData =
      getImageAnswerFirestoreData(imageAnswerStruct, forFieldValue);
  final nestedData =
      imageAnswerStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = imageAnswerStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImageAnswerFirestoreData(
  ImageAnswerStruct? imageAnswerStruct, [
  bool forFieldValue = false,
]) {
  if (imageAnswerStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(imageAnswerStruct.toMap());

  // Add any Firestore field values
  imageAnswerStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImageAnswerListFirestoreData(
  List<ImageAnswerStruct>? imageAnswerStructs,
) =>
    imageAnswerStructs
        ?.map((e) => getImageAnswerFirestoreData(e, true))
        .toList() ??
    [];
