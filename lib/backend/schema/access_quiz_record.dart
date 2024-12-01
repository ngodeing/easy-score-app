import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AccessQuizRecord extends FirestoreRecord {
  AccessQuizRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dosen_id" field.
  DocumentReference? _dosenId;
  DocumentReference? get dosenId => _dosenId;
  bool hasDosenId() => _dosenId != null;

  // "mahasiswa_id" field.
  DocumentReference? _mahasiswaId;
  DocumentReference? get mahasiswaId => _mahasiswaId;
  bool hasMahasiswaId() => _mahasiswaId != null;

  void _initializeFields() {
    _dosenId = snapshotData['dosen_id'] as DocumentReference?;
    _mahasiswaId = snapshotData['mahasiswa_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('access_quiz');

  static Stream<AccessQuizRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AccessQuizRecord.fromSnapshot(s));

  static Future<AccessQuizRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AccessQuizRecord.fromSnapshot(s));

  static AccessQuizRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AccessQuizRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AccessQuizRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AccessQuizRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AccessQuizRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AccessQuizRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAccessQuizRecordData({
  DocumentReference? dosenId,
  DocumentReference? mahasiswaId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dosen_id': dosenId,
      'mahasiswa_id': mahasiswaId,
    }.withoutNulls,
  );

  return firestoreData;
}

class AccessQuizRecordDocumentEquality implements Equality<AccessQuizRecord> {
  const AccessQuizRecordDocumentEquality();

  @override
  bool equals(AccessQuizRecord? e1, AccessQuizRecord? e2) {
    return e1?.dosenId == e2?.dosenId && e1?.mahasiswaId == e2?.mahasiswaId;
  }

  @override
  int hash(AccessQuizRecord? e) =>
      const ListEquality().hash([e?.dosenId, e?.mahasiswaId]);

  @override
  bool isValidKey(Object? o) => o is AccessQuizRecord;
}
