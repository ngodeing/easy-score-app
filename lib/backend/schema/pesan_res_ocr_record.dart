import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PesanResOcrRecord extends FirestoreRecord {
  PesanResOcrRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "pesan" field.
  String? _pesan;
  String get pesan => _pesan ?? '';
  bool hasPesan() => _pesan != null;

  // "pesanID" field.
  DocumentReference? _pesanID;
  DocumentReference? get pesanID => _pesanID;
  bool hasPesanID() => _pesanID != null;

  void _initializeFields() {
    _pesan = snapshotData['pesan'] as String?;
    _pesanID = snapshotData['pesanID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pesanResOcr');

  static Stream<PesanResOcrRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PesanResOcrRecord.fromSnapshot(s));

  static Future<PesanResOcrRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PesanResOcrRecord.fromSnapshot(s));

  static PesanResOcrRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PesanResOcrRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PesanResOcrRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PesanResOcrRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PesanResOcrRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PesanResOcrRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPesanResOcrRecordData({
  String? pesan,
  DocumentReference? pesanID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pesan': pesan,
      'pesanID': pesanID,
    }.withoutNulls,
  );

  return firestoreData;
}

class PesanResOcrRecordDocumentEquality implements Equality<PesanResOcrRecord> {
  const PesanResOcrRecordDocumentEquality();

  @override
  bool equals(PesanResOcrRecord? e1, PesanResOcrRecord? e2) {
    return e1?.pesan == e2?.pesan && e1?.pesanID == e2?.pesanID;
  }

  @override
  int hash(PesanResOcrRecord? e) =>
      const ListEquality().hash([e?.pesan, e?.pesanID]);

  @override
  bool isValidKey(Object? o) => o is PesanResOcrRecord;
}
