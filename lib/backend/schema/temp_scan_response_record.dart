import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TempScanResponseRecord extends FirestoreRecord {
  TempScanResponseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "questionId" field.
  DocumentReference? _questionId;
  DocumentReference? get questionId => _questionId;
  bool hasQuestionId() => _questionId != null;

  // "scan_result" field.
  String? _scanResult;
  String get scanResult => _scanResult ?? '';
  bool hasScanResult() => _scanResult != null;

  // "images" field.
  String? _images;
  String get images => _images ?? '';
  bool hasImages() => _images != null;

  void _initializeFields() {
    _questionId = snapshotData['questionId'] as DocumentReference?;
    _scanResult = snapshotData['scan_result'] as String?;
    _images = snapshotData['images'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('temp_scan_response');

  static Stream<TempScanResponseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TempScanResponseRecord.fromSnapshot(s));

  static Future<TempScanResponseRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TempScanResponseRecord.fromSnapshot(s));

  static TempScanResponseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TempScanResponseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TempScanResponseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TempScanResponseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TempScanResponseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TempScanResponseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTempScanResponseRecordData({
  DocumentReference? questionId,
  String? scanResult,
  String? images,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'questionId': questionId,
      'scan_result': scanResult,
      'images': images,
    }.withoutNulls,
  );

  return firestoreData;
}

class TempScanResponseRecordDocumentEquality
    implements Equality<TempScanResponseRecord> {
  const TempScanResponseRecordDocumentEquality();

  @override
  bool equals(TempScanResponseRecord? e1, TempScanResponseRecord? e2) {
    return e1?.questionId == e2?.questionId &&
        e1?.scanResult == e2?.scanResult &&
        e1?.images == e2?.images;
  }

  @override
  int hash(TempScanResponseRecord? e) =>
      const ListEquality().hash([e?.questionId, e?.scanResult, e?.images]);

  @override
  bool isValidKey(Object? o) => o is TempScanResponseRecord;
}
