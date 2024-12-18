import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'savedposts_model.dart';
export 'savedposts_model.dart';

class SavedpostsWidget extends StatefulWidget {
  const SavedpostsWidget({super.key});

  @override
  State<SavedpostsWidget> createState() => _SavedpostsWidgetState();
}

class _SavedpostsWidgetState extends State<SavedpostsWidget> {
  late SavedpostsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SavedpostsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'savedposts'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(
                      maxWidth: 870.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'SAVEDPOSTS_PAGE_arrow_back_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_navigate_to');

                                    context.pushNamed('userProfile');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    'Saved Posts',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: AuthUserStreamWidget(
                            builder: (context) => Builder(
                              builder: (context) {
                                final savedPostGen = (currentUserDocument
                                            ?.savedPosts
                                            .toList() ??
                                        [])
                                    .toList();

                                return GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 1.0,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount: savedPostGen.length,
                                  itemBuilder: (context, savedPostGenIndex) {
                                    final savedPostGenItem =
                                        savedPostGen[savedPostGenIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'SAVEDPOSTS_Container_ngechdc5_ON_TAP');
                                        logFirebaseEvent(
                                            'Container_navigate_to');

                                        context.pushNamed(
                                          'postPage',
                                          queryParameters: {
                                            'postArtist': serializeParam(
                                              valueOrDefault<int>(
                                                (currentUserDocument
                                                            ?.savedPostsPostArtist
                                                            .toList() ??
                                                        [])
                                                    .elementAtOrNull(
                                                        savedPostGenIndex),
                                                0,
                                              ),
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: const TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.scale,
                                              alignment: Alignment.bottomCenter,
                                              duration:
                                                  Duration(milliseconds: 300),
                                            ),
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                        ),
                                        child: StreamBuilder<
                                            List<ArtistFlashPostRecord>>(
                                          stream: queryArtistFlashPostRecord(
                                            queryBuilder:
                                                (artistFlashPostRecord) =>
                                                    artistFlashPostRecord.where(
                                              'uid',
                                              isEqualTo: (currentUserDocument
                                                          ?.savedPosts
                                                          .toList() ??
                                                      [])
                                                  .elementAtOrNull(2)
                                                  ?.id,
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<ArtistFlashPostRecord>
                                                imageArtistFlashPostRecordList =
                                                snapshot.data!;

                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: Image.network(
                                                imageArtistFlashPostRecordList
                                                    .elementAtOrNull((currentUserDocument
                                                                ?.savedPostsPostArtist
                                                                .toList() ??
                                                            [])
                                                        .elementAtOrNull(
                                                            savedPostGenIndex)!)!
                                                    .flashPhoto,
                                                width: 200.0,
                                                height: 200.0,
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
