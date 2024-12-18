import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArtistFlashPostRecord extends FirestoreRecord {
  ArtistFlashPostRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "postTitle" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  // "postDescription" field.
  String? _postDescription;
  String get postDescription => _postDescription ?? '';
  bool hasPostDescription() => _postDescription != null;

  // "timePosted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "postUser" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "postArtistName" field.
  String? _postArtistName;
  String get postArtistName => _postArtistName ?? '';
  bool hasPostArtistName() => _postArtistName != null;

  // "flashPhoto" field.
  String? _flashPhoto;
  String get flashPhoto => _flashPhoto ?? '';
  bool hasFlashPhoto() => _flashPhoto != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "savedBy" field.
  List<DocumentReference>? _savedBy;
  List<DocumentReference> get savedBy => _savedBy ?? const [];
  bool hasSavedBy() => _savedBy != null;

  void _initializeFields() {
    _postTitle = snapshotData['postTitle'] as String?;
    _postDescription = snapshotData['postDescription'] as String?;
    _timePosted = snapshotData['timePosted'] as DateTime?;
    _postUser = snapshotData['postUser'] as DocumentReference?;
    _postArtistName = snapshotData['postArtistName'] as String?;
    _flashPhoto = snapshotData['flashPhoto'] as String?;
    _uid = snapshotData['uid'] as String?;
    _savedBy = getDataList(snapshotData['savedBy']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('artistFlashPost');

  static Stream<ArtistFlashPostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArtistFlashPostRecord.fromSnapshot(s));

  static Future<ArtistFlashPostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArtistFlashPostRecord.fromSnapshot(s));

  static ArtistFlashPostRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArtistFlashPostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArtistFlashPostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArtistFlashPostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArtistFlashPostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArtistFlashPostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArtistFlashPostRecordData({
  String? postTitle,
  String? postDescription,
  DateTime? timePosted,
  DocumentReference? postUser,
  String? postArtistName,
  String? flashPhoto,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postTitle': postTitle,
      'postDescription': postDescription,
      'timePosted': timePosted,
      'postUser': postUser,
      'postArtistName': postArtistName,
      'flashPhoto': flashPhoto,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArtistFlashPostRecordDocumentEquality
    implements Equality<ArtistFlashPostRecord> {
  const ArtistFlashPostRecordDocumentEquality();

  @override
  bool equals(ArtistFlashPostRecord? e1, ArtistFlashPostRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postTitle == e2?.postTitle &&
        e1?.postDescription == e2?.postDescription &&
        e1?.timePosted == e2?.timePosted &&
        e1?.postUser == e2?.postUser &&
        e1?.postArtistName == e2?.postArtistName &&
        e1?.flashPhoto == e2?.flashPhoto &&
        e1?.uid == e2?.uid &&
        listEquality.equals(e1?.savedBy, e2?.savedBy);
  }

  @override
  int hash(ArtistFlashPostRecord? e) => const ListEquality().hash([
        e?.postTitle,
        e?.postDescription,
        e?.timePosted,
        e?.postUser,
        e?.postArtistName,
        e?.flashPhoto,
        e?.uid,
        e?.savedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is ArtistFlashPostRecord;
}
