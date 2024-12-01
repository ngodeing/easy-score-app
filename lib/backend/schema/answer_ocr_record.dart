import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnswerOcrRecord extends FirestoreRecord {
  AnswerOcrRecord._(
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
      FirebaseFirestore.instance.collection('answer_ocr');

  static Stream<AnswerOcrRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnswerOcrRecord.fromSnapshot(s));

  static Future<AnswerOcrRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnswerOcrRecord.fromSnapshot(s));

  static AnswerOcrRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnswerOcrRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnswerOcrRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnswerOcrRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnswerOcrRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnswerOcrRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnswerOcrRecordData({
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

class AnswerOcrRecordDocumentEquality implements Equality<AnswerOcrRecord> {
  const AnswerOcrRecordDocumentEquality();

  @override
  bool equals(AnswerOcrRecord? e1, AnswerOcrRecord? e2) {
    return e1?.quizId == e2?.quizId && e1?.value == e2?.value;
  }

  @override
  int hash(AnswerOcrRecord? e) =>
      const ListEquality().hash([e?.quizId, e?.value]);

  @override
  bool isValidKey(Object? o) => o is AnswerOcrRecord;
}
