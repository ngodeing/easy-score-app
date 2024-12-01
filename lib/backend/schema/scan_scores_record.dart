import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScanScoresRecord extends FirestoreRecord {
  ScanScoresRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "quizID" field.
  DocumentReference? _quizID;
  DocumentReference? get quizID => _quizID;
  bool hasQuizID() => _quizID != null;

  // "score" field.
  int? _score;
  int get score => _score ?? 0;
  bool hasScore() => _score != null;

  void _initializeFields() {
    _quizID = snapshotData['quizID'] as DocumentReference?;
    _score = castToType<int>(snapshotData['score']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('scan_scores');

  static Stream<ScanScoresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScanScoresRecord.fromSnapshot(s));

  static Future<ScanScoresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ScanScoresRecord.fromSnapshot(s));

  static ScanScoresRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ScanScoresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScanScoresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScanScoresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScanScoresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScanScoresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createScanScoresRecordData({
  DocumentReference? quizID,
  int? score,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quizID': quizID,
      'score': score,
    }.withoutNulls,
  );

  return firestoreData;
}

class ScanScoresRecordDocumentEquality implements Equality<ScanScoresRecord> {
  const ScanScoresRecordDocumentEquality();

  @override
  bool equals(ScanScoresRecord? e1, ScanScoresRecord? e2) {
    return e1?.quizID == e2?.quizID && e1?.score == e2?.score;
  }

  @override
  int hash(ScanScoresRecord? e) =>
      const ListEquality().hash([e?.quizID, e?.score]);

  @override
  bool isValidKey(Object? o) => o is ScanScoresRecord;
}
