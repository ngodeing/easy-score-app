import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScanPesanRecord extends FirestoreRecord {
  ScanPesanRecord._(
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
      FirebaseFirestore.instance.collection('scan_pesan');

  static Stream<ScanPesanRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScanPesanRecord.fromSnapshot(s));

  static Future<ScanPesanRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ScanPesanRecord.fromSnapshot(s));

  static ScanPesanRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ScanPesanRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScanPesanRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScanPesanRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScanPesanRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScanPesanRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createScanPesanRecordData({
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

class ScanPesanRecordDocumentEquality implements Equality<ScanPesanRecord> {
  const ScanPesanRecordDocumentEquality();

  @override
  bool equals(ScanPesanRecord? e1, ScanPesanRecord? e2) {
    return e1?.quizID == e2?.quizID && e1?.value == e2?.value;
  }

  @override
  int hash(ScanPesanRecord? e) =>
      const ListEquality().hash([e?.quizID, e?.value]);

  @override
  bool isValidKey(Object? o) => o is ScanPesanRecord;
}
