import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TotalRecord extends FirestoreRecord {
  TotalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ticketprice" field.
  int? _ticketprice;
  int get ticketprice => _ticketprice ?? 0;
  bool hasTicketprice() => _ticketprice != null;

  // "totalprice" field.
  double? _totalprice;
  double get totalprice => _totalprice ?? 0.0;
  bool hasTotalprice() => _totalprice != null;

  // "sum" field.
  int? _sum;
  int get sum => _sum ?? 0;
  bool hasSum() => _sum != null;

  void _initializeFields() {
    _ticketprice = castToType<int>(snapshotData['ticketprice']);
    _totalprice = castToType<double>(snapshotData['totalprice']);
    _sum = castToType<int>(snapshotData['sum']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('total');

  static Stream<TotalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TotalRecord.fromSnapshot(s));

  static Future<TotalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TotalRecord.fromSnapshot(s));

  static TotalRecord fromSnapshot(DocumentSnapshot snapshot) => TotalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TotalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TotalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TotalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TotalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTotalRecordData({
  int? ticketprice,
  double? totalprice,
  int? sum,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ticketprice': ticketprice,
      'totalprice': totalprice,
      'sum': sum,
    }.withoutNulls,
  );

  return firestoreData;
}

class TotalRecordDocumentEquality implements Equality<TotalRecord> {
  const TotalRecordDocumentEquality();

  @override
  bool equals(TotalRecord? e1, TotalRecord? e2) {
    return e1?.ticketprice == e2?.ticketprice &&
        e1?.totalprice == e2?.totalprice &&
        e1?.sum == e2?.sum;
  }

  @override
  int hash(TotalRecord? e) =>
      const ListEquality().hash([e?.ticketprice, e?.totalprice, e?.sum]);

  @override
  bool isValidKey(Object? o) => o is TotalRecord;
}
