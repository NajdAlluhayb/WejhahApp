import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventbookingRecord extends FirestoreRecord {
  EventbookingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "eveantname" field.
  String? _eveantname;
  String get eveantname => _eveantname ?? '';
  bool hasEveantname() => _eveantname != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _eveantname = snapshotData['eveantname'] as String?;
    _location = snapshotData['location'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('eventbooking');

  static Stream<EventbookingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventbookingRecord.fromSnapshot(s));

  static Future<EventbookingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventbookingRecord.fromSnapshot(s));

  static EventbookingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventbookingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventbookingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventbookingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventbookingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventbookingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventbookingRecordData({
  String? eveantname,
  String? location,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'eveantname': eveantname,
      'location': location,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventbookingRecordDocumentEquality
    implements Equality<EventbookingRecord> {
  const EventbookingRecordDocumentEquality();

  @override
  bool equals(EventbookingRecord? e1, EventbookingRecord? e2) {
    return e1?.eveantname == e2?.eveantname &&
        e1?.location == e2?.location &&
        e1?.description == e2?.description;
  }

  @override
  int hash(EventbookingRecord? e) =>
      const ListEquality().hash([e?.eveantname, e?.location, e?.description]);

  @override
  bool isValidKey(Object? o) => o is EventbookingRecord;
}
