import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'post_page_model.dart';
export 'post_page_model.dart';

class PostPageWidget extends StatefulWidget {
  const PostPageWidget({
    super.key,
    required this.postArtist,
  });

  final int? postArtist;

  @override
  State<PostPageWidget> createState() => _PostPageWidgetState();
}

class _PostPageWidgetState extends State<PostPageWidget> {
  late PostPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'postPage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ArtistFlashPostRecord>>(
      stream: queryArtistFlashPostRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ArtistFlashPostRecord> postPageArtistFlashPostRecordList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: SafeArea(
              top: true,
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('POST_PAGE_PAGE_BackButton_ON_TAP');
                          logFirebaseEvent('BackButton_navigate_to');

                          context.pushNamed(
                            'explorePage',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.leftToRight,
                                duration: Duration(milliseconds: 250),
                              ),
                            },
                          );
                        },
                        text: 'Back to Explore',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Colors.black,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Roboto Slab',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              width: 340.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(25.0),
                                ),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -0.5, 2.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      postPageArtistFlashPostRecordList
                                                          .elementAtOrNull(
                                                              widget
                                                                  .postArtist!)
                                                          ?.postArtistName,
                                                      'dummyValue',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Roboto Slab',
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Flexible(
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -0.5, -2.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      postPageArtistFlashPostRecordList
                                                          .elementAtOrNull(
                                                              widget
                                                                  .postArtist!)
                                                          ?.postDescription,
                                                      'dummyValue',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Roboto Slab',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(const SizedBox(height: 25.0)),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 30.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              key: const ValueKey('IconButton_75d3'),
                                              borderColor: Colors.transparent,
                                              borderRadius: 8.0,
                                              buttonSize: 65.0,
                                              fillColor: Colors.white,
                                              icon: const Icon(
                                                Icons.account_circle,
                                                color: Color(0xFF111111),
                                                size: 50.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'POST_PAGE_PAGE_account_circle_ICN_ON_TAP');
                                                logFirebaseEvent(
                                                    'IconButton_navigate_to');

                                                context.pushNamed(
                                                  'artistDisplayPage',
                                                  queryParameters: {
                                                    'artistUID': serializeParam(
                                                      postPageArtistFlashPostRecordList
                                                          .elementAtOrNull(
                                                              widget
                                                                  .postArtist!)
                                                          ?.uid,
                                                      ParamType.String,
                                                    ),
                                                    'userEmail': serializeParam(
                                                      currentUserEmail,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                        child: Image.network(
                          postPageArtistFlashPostRecordList
                              .elementAtOrNull(widget.postArtist!)!
                              .flashPhoto,
                          width: 364.0,
                          height: 338.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: StreamBuilder<List<ArtistFlashPostRecord>>(
                        stream: queryArtistFlashPostRecord(
                          queryBuilder: (artistFlashPostRecord) =>
                              artistFlashPostRecord.where(
                            'flashPhoto',
                            isEqualTo: postPageArtistFlashPostRecordList
                                .elementAtOrNull(widget.postArtist!)
                                ?.flashPhoto,
                          ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<ArtistFlashPostRecord>
                              saveToggleArtistFlashPostRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final saveToggleArtistFlashPostRecord =
                              saveToggleArtistFlashPostRecordList.isNotEmpty
                                  ? saveToggleArtistFlashPostRecordList.first
                                  : null;

                          return ToggleIcon(
                            onPressed: () async {
                              final savedByElement = currentUserReference;
                              final savedByUpdate =
                                  saveToggleArtistFlashPostRecord.savedBy
                                          .contains(savedByElement)
                                      ? FieldValue.arrayRemove([savedByElement])
                                      : FieldValue.arrayUnion([savedByElement]);
                              await saveToggleArtistFlashPostRecord.reference
                                  .update({
                                ...mapToFirestore(
                                  {
                                    'savedBy': savedByUpdate,
                                  },
                                ),
                              });
                              logFirebaseEvent(
                                  'POST_PAGE_PAGE_saveToggle_ON_TOGGLE');
                              if (saveToggleArtistFlashPostRecord.savedBy
                                  .contains(currentUserReference)) {
                                logFirebaseEvent('saveToggle_backend_call');

                                await saveToggleArtistFlashPostRecord.reference
                                    .update({
                                  ...mapToFirestore(
                                    {
                                      'savedBy': FieldValue.arrayRemove(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                                logFirebaseEvent('saveToggle_backend_call');

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'saved_posts': FieldValue.arrayRemove([
                                        saveToggleArtistFlashPostRecord
                                            .reference
                                      ]),
                                    },
                                  ),
                                });
                                logFirebaseEvent('saveToggle_backend_call');

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'saved_posts_postArtist':
                                          FieldValue.arrayRemove(
                                              [widget.postArtist]),
                                    },
                                  ),
                                });
                              } else {
                                logFirebaseEvent('saveToggle_backend_call');

                                await saveToggleArtistFlashPostRecord.reference
                                    .update({
                                  ...mapToFirestore(
                                    {
                                      'savedBy': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                                logFirebaseEvent('saveToggle_backend_call');

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'saved_posts': FieldValue.arrayUnion([
                                        saveToggleArtistFlashPostRecord
                                            .reference
                                      ]),
                                    },
                                  ),
                                });
                                logFirebaseEvent('saveToggle_backend_call');

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'saved_posts_postArtist':
                                          FieldValue.arrayUnion(
                                              [widget.postArtist]),
                                    },
                                  ),
                                });
                              }
                            },
                            value: saveToggleArtistFlashPostRecord!.savedBy
                                .contains(currentUserReference),
                            onIcon: Icon(
                              Icons.star,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 30.0,
                            ),
                            offIcon: Icon(
                              Icons.star_border,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 30.0,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
