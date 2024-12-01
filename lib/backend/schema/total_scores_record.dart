import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TotalScoresRecord extends FirestoreRecord {
  TotalScoresRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "total_scores" field.
  int? _totalScores;
  int get totalScores => _totalScores ?? 0;
  bool hasTotalScores() => _totalScores != null;

  // "id_totalScores" field.
  DocumentReference? _idTotalScores;
  DocumentReference? get idTotalScores => _idTotalScores;
  bool hasIdTotalScores() => _idTotalScores != null;

  void _initializeFields() {
    _totalScores = castToType<int>(snapshotData['total_scores']);
    _idTotalScores = snapshotData['id_totalScores'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('total_scores');

  static Stream<TotalScoresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TotalScoresRecord.fromSnapshot(s));

  static Future<TotalScoresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TotalScoresRecord.fromSnapshot(s));

  static TotalScoresRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TotalScoresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TotalScoresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TotalScoresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TotalScoresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TotalScoresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTotalScoresRecordData({
  int? totalScores,
  DocumentReference? idTotalScores,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'total_scores': totalScores,
      'id_totalScores': idTotalScores,
    }.withoutNulls,
  );

  return firestoreData;
}

class TotalScoresRecordDocumentEquality implements Equality<TotalScoresRecord> {
  const TotalScoresRecordDocumentEquality();

  @override
  bool equals(TotalScoresRecord? e1, TotalScoresRecord? e2) {
    return e1?.totalScores == e2?.totalScores &&
        e1?.idTotalScores == e2?.idTotalScores;
  }

  @override
  int hash(TotalScoresRecord? e) =>
      const ListEquality().hash([e?.totalScores, e?.idTotalScores]);

  @override
  bool isValidKey(Object? o) => o is TotalScoresRecord;
}
