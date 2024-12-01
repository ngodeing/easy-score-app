import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizzesRecord extends FirestoreRecord {
  QuizzesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "isAvailable" field.
  bool? _isAvailable;
  bool get isAvailable => _isAvailable ?? false;
  bool hasIsAvailable() => _isAvailable != null;

  // "accessibility" field.
  QuizAccessibility? _accessibility;
  QuizAccessibility? get accessibility => _accessibility;
  bool hasAccessibility() => _accessibility != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "questions" field.
  List<DocumentReference>? _questions;
  List<DocumentReference> get questions => _questions ?? const [];
  bool hasQuestions() => _questions != null;

  // "isRepeated" field.
  bool? _isRepeated;
  bool get isRepeated => _isRepeated ?? false;
  bool hasIsRepeated() => _isRepeated != null;

  // "access" field.
  DocumentReference? _access;
  DocumentReference? get access => _access;
  bool hasAccess() => _access != null;

  // "respons" field.
  List<DocumentReference>? _respons;
  List<DocumentReference> get respons => _respons ?? const [];
  bool hasRespons() => _respons != null;

  // "mode" field.
  String? _mode;
  String get mode => _mode ?? '';
  bool hasMode() => _mode != null;

  // "responsOcr" field.
  List<DocumentReference>? _responsOcr;
  List<DocumentReference> get responsOcr => _responsOcr ?? const [];
  bool hasResponsOcr() => _responsOcr != null;

  // "questionsOcr" field.
  List<DocumentReference>? _questionsOcr;
  List<DocumentReference> get questionsOcr => _questionsOcr ?? const [];
  bool hasQuestionsOcr() => _questionsOcr != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _name = snapshotData['name'] as String?;
    _duration = castToType<int>(snapshotData['duration']);
    _startTime = snapshotData['startTime'] as DateTime?;
    _isAvailable = snapshotData['isAvailable'] as bool?;
    _accessibility =
        deserializeEnum<QuizAccessibility>(snapshotData['accessibility']);
    _endTime = snapshotData['endTime'] as DateTime?;
    _questions = getDataList(snapshotData['questions']);
    _isRepeated = snapshotData['isRepeated'] as bool?;
    _access = snapshotData['access'] as DocumentReference?;
    _respons = getDataList(snapshotData['respons']);
    _mode = snapshotData['mode'] as String?;
    _responsOcr = getDataList(snapshotData['responsOcr']);
    _questionsOcr = getDataList(snapshotData['questionsOcr']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quizzes');

  static Stream<QuizzesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizzesRecord.fromSnapshot(s));

  static Future<QuizzesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizzesRecord.fromSnapshot(s));

  static QuizzesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizzesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizzesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizzesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizzesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizzesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizzesRecordData({
  String? uid,
  String? name,
  int? duration,
  DateTime? startTime,
  bool? isAvailable,
  QuizAccessibility? accessibility,
  DateTime? endTime,
  bool? isRepeated,
  DocumentReference? access,
  String? mode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'name': name,
      'duration': duration,
      'startTime': startTime,
      'isAvailable': isAvailable,
      'accessibility': accessibility,
      'endTime': endTime,
      'isRepeated': isRepeated,
      'access': access,
      'mode': mode,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizzesRecordDocumentEquality implements Equality<QuizzesRecord> {
  const QuizzesRecordDocumentEquality();

  @override
  bool equals(QuizzesRecord? e1, QuizzesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.name == e2?.name &&
        e1?.duration == e2?.duration &&
        e1?.startTime == e2?.startTime &&
        e1?.isAvailable == e2?.isAvailable &&
        e1?.accessibility == e2?.accessibility &&
        e1?.endTime == e2?.endTime &&
        listEquality.equals(e1?.questions, e2?.questions) &&
        e1?.isRepeated == e2?.isRepeated &&
        e1?.access == e2?.access &&
        listEquality.equals(e1?.respons, e2?.respons) &&
        e1?.mode == e2?.mode &&
        listEquality.equals(e1?.responsOcr, e2?.responsOcr) &&
        listEquality.equals(e1?.questionsOcr, e2?.questionsOcr);
  }

  @override
  int hash(QuizzesRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.name,
        e?.duration,
        e?.startTime,
        e?.isAvailable,
        e?.accessibility,
        e?.endTime,
        e?.questions,
        e?.isRepeated,
        e?.access,
        e?.respons,
        e?.mode,
        e?.responsOcr,
        e?.questionsOcr
      ]);

  @override
  bool isValidKey(Object? o) => o is QuizzesRecord;
}
