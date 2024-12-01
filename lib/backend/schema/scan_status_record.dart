import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScanStatusRecord extends FirestoreRecord {
  ScanStatusRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "quizID" field.
  DocumentReference? _quizID;
  DocumentReference? get quizID => _quizID;
  bool hasQuizID() => _quizID != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  bool hasValue() => _value != null;

  void _initializeFields() {
    _quizID = snapshotData['quizID'] as DocumentReference?;
    _value = snapshotData['value'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('scan_status');

  static Stream<ScanStatusRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScanStatusRecord.fromSnapshot(s));

  static Future<ScanStatusRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ScanStatusRecord.fromSnapshot(s));

  static ScanStatusRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ScanStatusRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScanStatusRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScanStatusRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScanStatusRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScanStatusRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createScanStatusRecordData({
  DocumentReference? quizID,
  String? value,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quizID': quizID,
      'value': value,
    }.withoutNulls,
  );

  return firestoreData;
}

class ScanStatusRecordDocumentEquality implements Equality<ScanStatusRecord> {
  const ScanStatusRecordDocumentEquality();

  @override
  bool equals(ScanStatusRecord? e1, ScanStatusRecord? e2) {
    return e1?.quizID == e2?.quizID && e1?.value == e2?.value;
  }

  @override
  int hash(ScanStatusRecord? e) =>
      const ListEquality().hash([e?.quizID, e?.value]);

  @override
  bool isValidKey(Object? o) => o is ScanStatusRecord;
}
