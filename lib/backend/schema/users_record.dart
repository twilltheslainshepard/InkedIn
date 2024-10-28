import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
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

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "tattoo_shop_name" field.
  String? _tattooShopName;
  String get tattooShopName => _tattooShopName ?? '';
  bool hasTattooShopName() => _tattooShopName != null;

  // "tattoo_shop_license" field.
  String? _tattooShopLicense;
  String get tattooShopLicense => _tattooShopLicense ?? '';
  bool hasTattooShopLicense() => _tattooShopLicense != null;

  // "tattoo_shop_address" field.
  String? _tattooShopAddress;
  String get tattooShopAddress => _tattooShopAddress ?? '';
  bool hasTattooShopAddress() => _tattooShopAddress != null;

  // "account_type" field.
  String? _accountType;
  String get accountType => _accountType ?? '';
  bool hasAccountType() => _accountType != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _birthday = snapshotData['birthday'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
    _address = snapshotData['address'] as String?;
    _tattooShopName = snapshotData['tattoo_shop_name'] as String?;
    _tattooShopLicense = snapshotData['tattoo_shop_license'] as String?;
    _tattooShopAddress = snapshotData['tattoo_shop_address'] as String?;
    _accountType = snapshotData['account_type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? birthday,
  String? uid,
  String? address,
  String? tattooShopName,
  String? tattooShopLicense,
  String? tattooShopAddress,
  String? accountType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'birthday': birthday,
      'uid': uid,
      'address': address,
      'tattoo_shop_name': tattooShopName,
      'tattoo_shop_license': tattooShopLicense,
      'tattoo_shop_address': tattooShopAddress,
      'account_type': accountType,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.birthday == e2?.birthday &&
        e1?.uid == e2?.uid &&
        e1?.address == e2?.address &&
        e1?.tattooShopName == e2?.tattooShopName &&
        e1?.tattooShopLicense == e2?.tattooShopLicense &&
        e1?.tattooShopAddress == e2?.tattooShopAddress &&
        e1?.accountType == e2?.accountType;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.createdTime,
        e?.phoneNumber,
        e?.birthday,
        e?.uid,
        e?.address,
        e?.tattooShopName,
        e?.tattooShopLicense,
        e?.tattooShopAddress,
        e?.accountType
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
