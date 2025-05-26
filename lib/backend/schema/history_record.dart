import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistoryRecord extends FirestoreRecord {
  HistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "event_total_price" field.
  double? _eventTotalPrice;
  double get eventTotalPrice => _eventTotalPrice ?? 0.0;
  bool hasEventTotalPrice() => _eventTotalPrice != null;

  // "event_userid" field.
  String? _eventUserid;
  String get eventUserid => _eventUserid ?? '';
  bool hasEventUserid() => _eventUserid != null;

  // "event_image" field.
  String? _eventImage;
  String get eventImage => _eventImage ?? '';
  bool hasEventImage() => _eventImage != null;

  void _initializeFields() {
    _eventName = snapshotData['event_name'] as String?;
    _eventTotalPrice = castToType<double>(snapshotData['event_total_price']);
    _eventUserid = snapshotData['event_userid'] as String?;
    _eventImage = snapshotData['event_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('History');

  static Stream<HistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HistoryRecord.fromSnapshot(s));

  static Future<HistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HistoryRecord.fromSnapshot(s));

  static HistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHistoryRecordData({
  String? eventName,
  double? eventTotalPrice,
  String? eventUserid,
  String? eventImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_name': eventName,
      'event_total_price': eventTotalPrice,
      'event_userid': eventUserid,
      'event_image': eventImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class HistoryRecordDocumentEquality implements Equality<HistoryRecord> {
  const HistoryRecordDocumentEquality();

  @override
  bool equals(HistoryRecord? e1, HistoryRecord? e2) {
    return e1?.eventName == e2?.eventName &&
        e1?.eventTotalPrice == e2?.eventTotalPrice &&
        e1?.eventUserid == e2?.eventUserid &&
        e1?.eventImage == e2?.eventImage;
  }

  @override
  int hash(HistoryRecord? e) => const ListEquality()
      .hash([e?.eventName, e?.eventTotalPrice, e?.eventUserid, e?.eventImage]);

  @override
  bool isValidKey(Object? o) => o is HistoryRecord;
}
