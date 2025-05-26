import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyTicketsRecord extends FirestoreRecord {
  MyTicketsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "EventName" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "Date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "QR" field.
  String? _qr;
  String get qr => _qr ?? '';
  bool hasQr() => _qr != null;

  // "seet" field.
  int? _seet;
  int get seet => _seet ?? 0;
  bool hasSeet() => _seet != null;

  // "UserId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "Time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "BarcodeSN" field.
  String? _barcodeSN;
  String get barcodeSN => _barcodeSN ?? '';
  bool hasBarcodeSN() => _barcodeSN != null;

  // "Dis" field.
  String? _dis;
  String get dis => _dis ?? '';
  bool hasDis() => _dis != null;

  // "BookedDate" field.
  DateTime? _bookedDate;
  DateTime? get bookedDate => _bookedDate;
  bool hasBookedDate() => _bookedDate != null;

  void _initializeFields() {
    _eventName = snapshotData['EventName'] as String?;
    _date = snapshotData['Date'] as String?;
    _qr = snapshotData['QR'] as String?;
    _seet = castToType<int>(snapshotData['seet']);
    _userId = snapshotData['UserId'] as String?;
    _time = snapshotData['Time'] as String?;
    _barcodeSN = snapshotData['BarcodeSN'] as String?;
    _dis = snapshotData['Dis'] as String?;
    _bookedDate = snapshotData['BookedDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('MyTickets');

  static Stream<MyTicketsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyTicketsRecord.fromSnapshot(s));

  static Future<MyTicketsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyTicketsRecord.fromSnapshot(s));

  static MyTicketsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MyTicketsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyTicketsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyTicketsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyTicketsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyTicketsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyTicketsRecordData({
  String? eventName,
  String? date,
  String? qr,
  int? seet,
  String? userId,
  String? time,
  String? barcodeSN,
  String? dis,
  DateTime? bookedDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'EventName': eventName,
      'Date': date,
      'QR': qr,
      'seet': seet,
      'UserId': userId,
      'Time': time,
      'BarcodeSN': barcodeSN,
      'Dis': dis,
      'BookedDate': bookedDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class MyTicketsRecordDocumentEquality implements Equality<MyTicketsRecord> {
  const MyTicketsRecordDocumentEquality();

  @override
  bool equals(MyTicketsRecord? e1, MyTicketsRecord? e2) {
    return e1?.eventName == e2?.eventName &&
        e1?.date == e2?.date &&
        e1?.qr == e2?.qr &&
        e1?.seet == e2?.seet &&
        e1?.userId == e2?.userId &&
        e1?.time == e2?.time &&
        e1?.barcodeSN == e2?.barcodeSN &&
        e1?.dis == e2?.dis &&
        e1?.bookedDate == e2?.bookedDate;
  }

  @override
  int hash(MyTicketsRecord? e) => const ListEquality().hash([
        e?.eventName,
        e?.date,
        e?.qr,
        e?.seet,
        e?.userId,
        e?.time,
        e?.barcodeSN,
        e?.dis,
        e?.bookedDate
      ]);

  @override
  bool isValidKey(Object? o) => o is MyTicketsRecord;
}
