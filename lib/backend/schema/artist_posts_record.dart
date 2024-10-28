import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArtistPostsRecord extends FirestoreRecord {
  ArtistPostsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "flashPhoto" field.
  String? _flashPhoto;
  String get flashPhoto => _flashPhoto ?? '';
  bool hasFlashPhoto() => _flashPhoto != null;

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

  // "postOwner" field.
  bool? _postOwner;
  bool get postOwner => _postOwner ?? false;
  bool hasPostOwner() => _postOwner != null;

  // "postUser" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  void _initializeFields() {
    _flashPhoto = snapshotData['flashPhoto'] as String?;
    _postTitle = snapshotData['postTitle'] as String?;
    _postDescription = snapshotData['postDescription'] as String?;
    _timePosted = snapshotData['timePosted'] as DateTime?;
    _postOwner = snapshotData['postOwner'] as bool?;
    _postUser = snapshotData['postUser'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('artistPosts');

  static Stream<ArtistPostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArtistPostsRecord.fromSnapshot(s));

  static Future<ArtistPostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArtistPostsRecord.fromSnapshot(s));

  static ArtistPostsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArtistPostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArtistPostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArtistPostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArtistPostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArtistPostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArtistPostsRecordData({
  String? flashPhoto,
  String? postTitle,
  String? postDescription,
  DateTime? timePosted,
  bool? postOwner,
  DocumentReference? postUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'flashPhoto': flashPhoto,
      'postTitle': postTitle,
      'postDescription': postDescription,
      'timePosted': timePosted,
      'postOwner': postOwner,
      'postUser': postUser,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArtistPostsRecordDocumentEquality implements Equality<ArtistPostsRecord> {
  const ArtistPostsRecordDocumentEquality();

  @override
  bool equals(ArtistPostsRecord? e1, ArtistPostsRecord? e2) {
    return e1?.flashPhoto == e2?.flashPhoto &&
        e1?.postTitle == e2?.postTitle &&
        e1?.postDescription == e2?.postDescription &&
        e1?.timePosted == e2?.timePosted &&
        e1?.postOwner == e2?.postOwner &&
        e1?.postUser == e2?.postUser;
  }

  @override
  int hash(ArtistPostsRecord? e) => const ListEquality().hash([
        e?.flashPhoto,
        e?.postTitle,
        e?.postDescription,
        e?.timePosted,
        e?.postOwner,
        e?.postUser
      ]);

  @override
  bool isValidKey(Object? o) => o is ArtistPostsRecord;
}
