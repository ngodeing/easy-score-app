import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponsesRecord extends FirestoreRecord {
  ResponsesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "quizId" field.
  DocumentReference? _quizId;
  DocumentReference? get quizId => _quizId;
  bool hasQuizId() => _quizId != null;

  // "userId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "answers" field.
  List<DocumentReference>? _answers;
  List<DocumentReference> get answers => _answers ?? const [];
  bool hasAnswers() => _answers != null;

  // "total_scores" field.
  int? _totalScores;
  int get totalScores => _totalScores ?? 0;
  bool hasTotalScores() => _totalScores != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _quizId = snapshotData['quizId'] as DocumentReference?;
    _userId = snapshotData['userId'] as DocumentReference?;
    _answers = getDataList(snapshotData['answers']);
    _totalScores = castToType<int>(snapshotData['total_scores']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('responses');

  static Stream<ResponsesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResponsesRecord.fromSnapshot(s));

  static Future<ResponsesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResponsesRecord.fromSnapshot(s));

  static ResponsesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResponsesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResponsesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResponsesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResponsesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResponsesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResponsesRecordData({
  String? uid,
  DocumentReference? quizId,
  DocumentReference? userId,
  int? totalScores,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'quizId': quizId,
      'userId': userId,
      'total_scores': totalScores,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResponsesRecordDocumentEquality implements Equality<ResponsesRecord> {
  const ResponsesRecordDocumentEquality();

  @override
  bool equals(ResponsesRecord? e1, ResponsesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.quizId == e2?.quizId &&
        e1?.userId == e2?.userId &&
        listEquality.equals(e1?.answers, e2?.answers) &&
        e1?.totalScores == e2?.totalScores;
  }

  @override
  int hash(ResponsesRecord? e) => const ListEquality()
      .hash([e?.uid, e?.quizId, e?.userId, e?.answers, e?.totalScores]);

  @override
  bool isValidKey(Object? o) => o is ResponsesRecord;
}
