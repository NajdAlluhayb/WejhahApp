import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrganizerRecord extends FirestoreRecord {
  OrganizerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userName = snapshotData['user_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('organizer');

  static Stream<OrganizerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrganizerRecord.fromSnapshot(s));

  static Future<OrganizerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrganizerRecord.fromSnapshot(s));

  static OrganizerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrganizerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrganizerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrganizerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrganizerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrganizerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrganizerRecordData({
  String? email,
  String? displayName,
  String? uid,
  String? phoneNumber,
  String? userName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'uid': uid,
      'phone_number': phoneNumber,
      'user_name': userName,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrganizerRecordDocumentEquality implements Equality<OrganizerRecord> {
  const OrganizerRecordDocumentEquality();

  @override
  bool equals(OrganizerRecord? e1, OrganizerRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.userName == e2?.userName;
  }

  @override
  int hash(OrganizerRecord? e) => const ListEquality()
      .hash([e?.email, e?.displayName, e?.uid, e?.phoneNumber, e?.userName]);

  @override
  bool isValidKey(Object? o) => o is OrganizerRecord;
}
