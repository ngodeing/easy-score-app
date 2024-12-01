import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionOcrRecord extends FirestoreRecord {
  QuestionOcrRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "quiz_id" field.
  DocumentReference? _quizId;
  DocumentReference? get quizId => _quizId;
  bool hasQuizId() => _quizId != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  bool hasValue() => _value != null;

  void _initializeFields() {
    _quizId = snapshotData['quiz_id'] as DocumentReference?;
    _value = snapshotData['value'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('question_ocr');

  static Stream<QuestionOcrRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionOcrRecord.fromSnapshot(s));

  static Future<QuestionOcrRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionOcrRecord.fromSnapshot(s));

  static QuestionOcrRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionOcrRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionOcrRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionOcrRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionOcrRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionOcrRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionOcrRecordData({
  DocumentReference? quizId,
  String? value,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quiz_id': quizId,
      'value': value,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionOcrRecordDocumentEquality implements Equality<QuestionOcrRecord> {
  const QuestionOcrRecordDocumentEquality();

  @override
  bool equals(QuestionOcrRecord? e1, QuestionOcrRecord? e2) {
    return e1?.quizId == e2?.quizId && e1?.value == e2?.value;
  }

  @override
  int hash(QuestionOcrRecord? e) =>
      const ListEquality().hash([e?.quizId, e?.value]);

  @override
  bool isValidKey(Object? o) => o is QuestionOcrRecord;
}
