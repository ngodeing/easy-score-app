import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionsRecord extends FirestoreRecord {
  QuestionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "quizId" field.
  DocumentReference? _quizId;
  DocumentReference? get quizId => _quizId;
  bool hasQuizId() => _quizId != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  bool hasValue() => _value != null;

  // "answer" field.
  DocumentReference? _answer;
  DocumentReference? get answer => _answer;
  bool hasAnswer() => _answer != null;

  void _initializeFields() {
    _quizId = snapshotData['quizId'] as DocumentReference?;
    _value = snapshotData['value'] as String?;
    _answer = snapshotData['answer'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('questions');

  static Stream<QuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionsRecord.fromSnapshot(s));

  static Future<QuestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionsRecord.fromSnapshot(s));

  static QuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionsRecordData({
  DocumentReference? quizId,
  String? value,
  DocumentReference? answer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quizId': quizId,
      'value': value,
      'answer': answer,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionsRecordDocumentEquality implements Equality<QuestionsRecord> {
  const QuestionsRecordDocumentEquality();

  @override
  bool equals(QuestionsRecord? e1, QuestionsRecord? e2) {
    return e1?.quizId == e2?.quizId &&
        e1?.value == e2?.value &&
        e1?.answer == e2?.answer;
  }

  @override
  int hash(QuestionsRecord? e) =>
      const ListEquality().hash([e?.quizId, e?.value, e?.answer]);

  @override
  bool isValidKey(Object? o) => o is QuestionsRecord;
}
