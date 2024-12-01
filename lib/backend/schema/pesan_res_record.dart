import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PesanResRecord extends FirestoreRecord {
  PesanResRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "pesanID" field.
  DocumentReference? _pesanID;
  DocumentReference? get pesanID => _pesanID;
  bool hasPesanID() => _pesanID != null;

  // "pesan" field.
  String? _pesan;
  String get pesan => _pesan ?? '';
  bool hasPesan() => _pesan != null;

  void _initializeFields() {
    _pesanID = snapshotData['pesanID'] as DocumentReference?;
    _pesan = snapshotData['pesan'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pesanRes');

  static Stream<PesanResRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PesanResRecord.fromSnapshot(s));

  static Future<PesanResRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PesanResRecord.fromSnapshot(s));

  static PesanResRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PesanResRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PesanResRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PesanResRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PesanResRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PesanResRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPesanResRecordData({
  DocumentReference? pesanID,
  String? pesan,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pesanID': pesanID,
      'pesan': pesan,
    }.withoutNulls,
  );

  return firestoreData;
}

class PesanResRecordDocumentEquality implements Equality<PesanResRecord> {
  const PesanResRecordDocumentEquality();

  @override
  bool equals(PesanResRecord? e1, PesanResRecord? e2) {
    return e1?.pesanID == e2?.pesanID && e1?.pesan == e2?.pesan;
  }

  @override
  int hash(PesanResRecord? e) =>
      const ListEquality().hash([e?.pesanID, e?.pesan]);

  @override
  bool isValidKey(Object? o) => o is PesanResRecord;
}
