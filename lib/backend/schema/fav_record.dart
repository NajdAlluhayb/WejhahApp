import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavRecord extends FirestoreRecord {
  FavRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "eventname" field.
  String? _eventname;
  String get eventname => _eventname ?? '';
  bool hasEventname() => _eventname != null;

  // "eventid" field.
  String? _eventid;
  String get eventid => _eventid ?? '';
  bool hasEventid() => _eventid != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _eventname = snapshotData['eventname'] as String?;
    _eventid = snapshotData['eventid'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('fav')
          : FirebaseFirestore.instance.collectionGroup('fav');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('fav').doc(id);

  static Stream<FavRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavRecord.fromSnapshot(s));

  static Future<FavRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavRecord.fromSnapshot(s));

  static FavRecord fromSnapshot(DocumentSnapshot snapshot) => FavRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavRecordData({
  String? uid,
  String? eventname,
  String? eventid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'eventname': eventname,
      'eventid': eventid,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavRecordDocumentEquality implements Equality<FavRecord> {
  const FavRecordDocumentEquality();

  @override
  bool equals(FavRecord? e1, FavRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.eventname == e2?.eventname &&
        e1?.eventid == e2?.eventid;
  }

  @override
  int hash(FavRecord? e) =>
      const ListEquality().hash([e?.uid, e?.eventname, e?.eventid]);

  @override
  bool isValidKey(Object? o) => o is FavRecord;
}
