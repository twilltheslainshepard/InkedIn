import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArtistPortfolioPostRecord extends FirestoreRecord {
  ArtistPortfolioPostRecord._(
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

  // "portfolioPhoto" field.
  String? _portfolioPhoto;
  String get portfolioPhoto => _portfolioPhoto ?? '';
  bool hasPortfolioPhoto() => _portfolioPhoto != null;

  void _initializeFields() {
    _postTitle = snapshotData['postTitle'] as String?;
    _postDescription = snapshotData['postDescription'] as String?;
    _timePosted = snapshotData['timePosted'] as DateTime?;
    _postUser = snapshotData['postUser'] as DocumentReference?;
    _portfolioPhoto = snapshotData['portfolioPhoto'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('artistPortfolioPost');

  static Stream<ArtistPortfolioPostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArtistPortfolioPostRecord.fromSnapshot(s));

  static Future<ArtistPortfolioPostRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ArtistPortfolioPostRecord.fromSnapshot(s));

  static ArtistPortfolioPostRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArtistPortfolioPostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArtistPortfolioPostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArtistPortfolioPostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArtistPortfolioPostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArtistPortfolioPostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArtistPortfolioPostRecordData({
  String? postTitle,
  String? postDescription,
  DateTime? timePosted,
  DocumentReference? postUser,
  String? portfolioPhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postTitle': postTitle,
      'postDescription': postDescription,
      'timePosted': timePosted,
      'postUser': postUser,
      'portfolioPhoto': portfolioPhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArtistPortfolioPostRecordDocumentEquality
    implements Equality<ArtistPortfolioPostRecord> {
  const ArtistPortfolioPostRecordDocumentEquality();

  @override
  bool equals(ArtistPortfolioPostRecord? e1, ArtistPortfolioPostRecord? e2) {
    return e1?.postTitle == e2?.postTitle &&
        e1?.postDescription == e2?.postDescription &&
        e1?.timePosted == e2?.timePosted &&
        e1?.postUser == e2?.postUser &&
        e1?.portfolioPhoto == e2?.portfolioPhoto;
  }

  @override
  int hash(ArtistPortfolioPostRecord? e) => const ListEquality().hash([
        e?.postTitle,
        e?.postDescription,
        e?.timePosted,
        e?.postUser,
        e?.portfolioPhoto
      ]);

  @override
  bool isValidKey(Object? o) => o is ArtistPortfolioPostRecord;
}
