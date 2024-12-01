import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponsesOcrRecord extends FirestoreRecord {
  ResponsesOcrRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "score" field.
  int? _score;
  int get score => _score ?? 0;
  bool hasScore() => _score != null;

  // "quiz_id" field.
  DocumentReference? _quizId;
  DocumentReference? get quizId => _quizId;
  bool hasQuizId() => _quizId != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "answer_mhs" field.
  DocumentReference? _answerMhs;
  DocumentReference? get answerMhs => _answerMhs;
  bool hasAnswerMhs() => _answerMhs != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _score = castToType<int>(snapshotData['score']);
    _quizId = snapshotData['quiz_id'] as DocumentReference?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _answerMhs = snapshotData['answer_mhs'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('responses_ocr');

  static Stream<ResponsesOcrRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResponsesOcrRecord.fromSnapshot(s));

  static Future<ResponsesOcrRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResponsesOcrRecord.fromSnapshot(s));

  static ResponsesOcrRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResponsesOcrRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResponsesOcrRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResponsesOcrRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResponsesOcrRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResponsesOcrRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResponsesOcrRecordData({
  String? uid,
  int? score,
  DocumentReference? quizId,
  DocumentReference? userId,
  DocumentReference? answerMhs,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'score': score,
      'quiz_id': quizId,
      'user_id': userId,
      'answer_mhs': answerMhs,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResponsesOcrRecordDocumentEquality
    implements Equality<ResponsesOcrRecord> {
  const ResponsesOcrRecordDocumentEquality();

  @override
  bool equals(ResponsesOcrRecord? e1, ResponsesOcrRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.score == e2?.score &&
        e1?.quizId == e2?.quizId &&
        e1?.userId == e2?.userId &&
        e1?.answerMhs == e2?.answerMhs;
  }

  @override
  int hash(ResponsesOcrRecord? e) => const ListEquality()
      .hash([e?.uid, e?.score, e?.quizId, e?.userId, e?.answerMhs]);

  @override
  bool isValidKey(Object? o) => o is ResponsesOcrRecord;
}
