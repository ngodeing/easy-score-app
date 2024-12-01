import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatusResRecord extends FirestoreRecord {
  StatusResRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "statusID" field.
  DocumentReference? _statusID;
  DocumentReference? get statusID => _statusID;
  bool hasStatusID() => _statusID != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _statusID = snapshotData['statusID'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('statusRes');

  static Stream<StatusResRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StatusResRecord.fromSnapshot(s));

  static Future<StatusResRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StatusResRecord.fromSnapshot(s));

  static StatusResRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StatusResRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StatusResRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StatusResRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StatusResRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StatusResRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStatusResRecordData({
  DocumentReference? statusID,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'statusID': statusID,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class StatusResRecordDocumentEquality implements Equality<StatusResRecord> {
  const StatusResRecordDocumentEquality();

  @override
  bool equals(StatusResRecord? e1, StatusResRecord? e2) {
    return e1?.statusID == e2?.statusID && e1?.status == e2?.status;
  }

  @override
  int hash(StatusResRecord? e) =>
      const ListEquality().hash([e?.statusID, e?.status]);

  @override
  bool isValidKey(Object? o) => o is StatusResRecord;
}
