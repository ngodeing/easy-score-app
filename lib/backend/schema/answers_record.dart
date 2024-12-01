import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnswersRecord extends FirestoreRecord {
  AnswersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "answerText" field.
  String? _answerText;
  String get answerText => _answerText ?? '';
  bool hasAnswerText() => _answerText != null;

  // "questionId" field.
  DocumentReference? _questionId;
  DocumentReference? get questionId => _questionId;
  bool hasQuestionId() => _questionId != null;

  // "scores" field.
  DocumentReference? _scores;
  DocumentReference? get scores => _scores;
  bool hasScores() => _scores != null;

  void _initializeFields() {
    _answerText = snapshotData['answerText'] as String?;
    _questionId = snapshotData['questionId'] as DocumentReference?;
    _scores = snapshotData['scores'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('answers');

  static Stream<AnswersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnswersRecord.fromSnapshot(s));

  static Future<AnswersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnswersRecord.fromSnapshot(s));

  static AnswersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnswersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnswersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnswersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnswersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnswersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnswersRecordData({
  String? answerText,
  DocumentReference? questionId,
  DocumentReference? scores,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'answerText': answerText,
      'questionId': questionId,
      'scores': scores,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnswersRecordDocumentEquality implements Equality<AnswersRecord> {
  const AnswersRecordDocumentEquality();

  @override
  bool equals(AnswersRecord? e1, AnswersRecord? e2) {
    return e1?.answerText == e2?.answerText &&
        e1?.questionId == e2?.questionId &&
        e1?.scores == e2?.scores;
  }

  @override
  int hash(AnswersRecord? e) =>
      const ListEquality().hash([e?.answerText, e?.questionId, e?.scores]);

  @override
  bool isValidKey(Object? o) => o is AnswersRecord;
}
