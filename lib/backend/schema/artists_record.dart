import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArtistsRecord extends FirestoreRecord {
  ArtistsRecord._(
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

  // "tattoo_shop" field.
  String? _tattooShop;
  String get tattooShop => _tattooShop ?? '';
  bool hasTattooShop() => _tattooShop != null;

  // "shop_address" field.
  String? _shopAddress;
  String get shopAddress => _shopAddress ?? '';
  bool hasShopAddress() => _shopAddress != null;

  // "tattoo_license" field.
  String? _tattooLicense;
  String get tattooLicense => _tattooLicense ?? '';
  bool hasTattooLicense() => _tattooLicense != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _birthday = snapshotData['birthday'] as DateTime?;
    _tattooShop = snapshotData['tattoo_shop'] as String?;
    _shopAddress = snapshotData['shop_address'] as String?;
    _tattooLicense = snapshotData['tattoo_license'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('artists');

  static Stream<ArtistsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArtistsRecord.fromSnapshot(s));

  static Future<ArtistsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArtistsRecord.fromSnapshot(s));

  static ArtistsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArtistsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArtistsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArtistsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArtistsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArtistsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArtistsRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? birthday,
  String? tattooShop,
  String? shopAddress,
  String? tattooLicense,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'birthday': birthday,
      'tattoo_shop': tattooShop,
      'shop_address': shopAddress,
      'tattoo_license': tattooLicense,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArtistsRecordDocumentEquality implements Equality<ArtistsRecord> {
  const ArtistsRecordDocumentEquality();

  @override
  bool equals(ArtistsRecord? e1, ArtistsRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.birthday == e2?.birthday &&
        e1?.tattooShop == e2?.tattooShop &&
        e1?.shopAddress == e2?.shopAddress &&
        e1?.tattooLicense == e2?.tattooLicense;
  }

  @override
  int hash(ArtistsRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.createdTime,
        e?.phoneNumber,
        e?.birthday,
        e?.tattooShop,
        e?.shopAddress,
        e?.tattooLicense
      ]);

  @override
  bool isValidKey(Object? o) => o is ArtistsRecord;
}
