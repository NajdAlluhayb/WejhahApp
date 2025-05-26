import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavoritesRecord extends FirestoreRecord {
  FavoritesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "eventname" field.
  String? _eventname;
  String get eventname => _eventname ?? '';
  bool hasEventname() => _eventname != null;

  // "userid" field.
  String? _userid;
  String get userid => _userid ?? '';
  bool hasUserid() => _userid != null;

  // "eventdis" field.
  String? _eventdis;
  String get eventdis => _eventdis ?? '';
  bool hasEventdis() => _eventdis != null;

  // "urlimage" field.
  String? _urlimage;
  String get urlimage => _urlimage ?? '';
  bool hasUrlimage() => _urlimage != null;

  void _initializeFields() {
    _eventname = snapshotData['eventname'] as String?;
    _userid = snapshotData['userid'] as String?;
    _eventdis = snapshotData['eventdis'] as String?;
    _urlimage = snapshotData['urlimage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('favorites');

  static Stream<FavoritesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavoritesRecord.fromSnapshot(s));

  static Future<FavoritesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavoritesRecord.fromSnapshot(s));

  static FavoritesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavoritesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavoritesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavoritesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavoritesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavoritesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavoritesRecordData({
  String? eventname,
  String? userid,
  String? eventdis,
  String? urlimage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'eventname': eventname,
      'userid': userid,
      'eventdis': eventdis,
      'urlimage': urlimage,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavoritesRecordDocumentEquality implements Equality<FavoritesRecord> {
  const FavoritesRecordDocumentEquality();

  @override
  bool equals(FavoritesRecord? e1, FavoritesRecord? e2) {
    return e1?.eventname == e2?.eventname &&
        e1?.userid == e2?.userid &&
        e1?.eventdis == e2?.eventdis &&
        e1?.urlimage == e2?.urlimage;
  }

  @override
  int hash(FavoritesRecord? e) => const ListEquality()
      .hash([e?.eventname, e?.userid, e?.eventdis, e?.urlimage]);

  @override
  bool isValidKey(Object? o) => o is FavoritesRecord;
}
