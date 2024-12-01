import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnswerMhsOcrRecord extends FirestoreRecord {
  AnswerMhsOcrRecord._(
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
      FirebaseFirestore.instance.collection('answer_mhs_ocr');

  static Stream<AnswerMhsOcrRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnswerMhsOcrRecord.fromSnapshot(s));

  static Future<AnswerMhsOcrRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnswerMhsOcrRecord.fromSnapshot(s));

  static AnswerMhsOcrRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnswerMhsOcrRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnswerMhsOcrRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnswerMhsOcrRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnswerMhsOcrRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnswerMhsOcrRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnswerMhsOcrRecordData({
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

class AnswerMhsOcrRecordDocumentEquality
    implements Equality<AnswerMhsOcrRecord> {
  const AnswerMhsOcrRecordDocumentEquality();

  @override
  bool equals(AnswerMhsOcrRecord? e1, AnswerMhsOcrRecord? e2) {
    return e1?.quizId == e2?.quizId && e1?.value == e2?.value;
  }

  @override
  int hash(AnswerMhsOcrRecord? e) =>
      const ListEquality().hash([e?.quizId, e?.value]);

  @override
  bool isValidKey(Object? o) => o is AnswerMhsOcrRecord;
}
