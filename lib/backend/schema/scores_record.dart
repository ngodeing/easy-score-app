import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScoresRecord extends FirestoreRecord {
  ScoresRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_score" field.
  DocumentReference? _idScore;
  DocumentReference? get idScore => _idScore;
  bool hasIdScore() => _idScore != null;

  // "score" field.
  int? _score;
  int get score => _score ?? 0;
  bool hasScore() => _score != null;

  void _initializeFields() {
    _idScore = snapshotData['id_score'] as DocumentReference?;
    _score = castToType<int>(snapshotData['score']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('scores');

  static Stream<ScoresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScoresRecord.fromSnapshot(s));

  static Future<ScoresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ScoresRecord.fromSnapshot(s));

  static ScoresRecord fromSnapshot(DocumentSnapshot snapshot) => ScoresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScoresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScoresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScoresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScoresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createScoresRecordData({
  DocumentReference? idScore,
  int? score,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_score': idScore,
      'score': score,
    }.withoutNulls,
  );

  return firestoreData;
}

class ScoresRecordDocumentEquality implements Equality<ScoresRecord> {
  const ScoresRecordDocumentEquality();

  @override
  bool equals(ScoresRecord? e1, ScoresRecord? e2) {
    return e1?.idScore == e2?.idScore && e1?.score == e2?.score;
  }

  @override
  int hash(ScoresRecord? e) =>
      const ListEquality().hash([e?.idScore, e?.score]);

  @override
  bool isValidKey(Object? o) => o is ScoresRecord;
}
