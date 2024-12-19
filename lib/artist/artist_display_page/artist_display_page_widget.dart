import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'artist_display_page_model.dart';
export 'artist_display_page_model.dart';

class ArtistDisplayPageWidget extends StatefulWidget {
  const ArtistDisplayPageWidget({
    super.key,
    String? artistUID,
    this.userEmail,
  }) : artistUID = artistUID ?? '0';

  final String artistUID;
  final String? userEmail;

  @override
  State<ArtistDisplayPageWidget> createState() =>
      _ArtistDisplayPageWidgetState();
}

class _ArtistDisplayPageWidgetState extends State<ArtistDisplayPageWidget>
    with TickerProviderStateMixin {
  late ArtistDisplayPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArtistDisplayPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'artistDisplayPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ARTIST_DISPLAY_artistDisplayPage_ON_INIT');
      logFirebaseEvent('artistDisplayPage_firestore_query');
      await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord.where(
          'email',
          isEqualTo: '',
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord.where(
          'uid',
          isEqualTo: widget.artistUID,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<UsersRecord> artistDisplayPageUsersRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final artistDisplayPageUsersRecord =
            artistDisplayPageUsersRecordList.isNotEmpty
                ? artistDisplayPageUsersRecordList.first
                : null;

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
              child: Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
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
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            shape: BoxShape.rectangle,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'ARTIST_DISPLAY_arrow_back_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_navigate_back');
                                        context.safePop();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 16.0, 0.0),
                                      child: Container(
                                        width: 80.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            artistDisplayPageUsersRecord!
                                                .photoUrl,
                                            width: 300.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            artistDisplayPageUsersRecord
                                                .displayName,
                                            'artist',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              artistDisplayPageUsersRecord
                                                  .tattooShopName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Text(
                                              artistDisplayPageUsersRecord
                                                  .tattooShopAddress,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 12.0),
                                      child: FFButtonWidget(
                                        key: const ValueKey('bookAppoinment_9ujc'),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'ARTIST_DISPLAY_bookAppoinment_ON_TAP');
                                          logFirebaseEvent(
                                              'bookAppoinment_navigate_to');

                                          context.pushNamed(
                                            'EmailTestPage',
                                            queryParameters: {
                                              'artistEmail': serializeParam(
                                                artistDisplayPageUsersRecord
                                                    .email,
                                                ParamType.String,
                                              ),
                                              'userEmail': serializeParam(
                                                currentUserEmail,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        text: 'Book Appointment',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Inter Tight',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: const Alignment(0.0, 0),
                                      child: TabBar(
                                        labelColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        unselectedLabelColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              letterSpacing: 0.0,
                                            ),
                                        unselectedLabelStyle:
                                            FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Inter Tight',
                                                  letterSpacing: 0.0,
                                                ),
                                        indicatorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        tabs: const [
                                          Tab(
                                            text: 'Flash Pieces',
                                          ),
                                          Tab(
                                            text: 'Portfolio',
                                          ),
                                        ],
                                        controller: _model.tabBarController,
                                        onTap: (i) async {
                                          [() async {}, () async {}][i]();
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _model.tabBarController,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: StreamBuilder<
                                                    List<
                                                        ArtistFlashPostRecord>>(
                                                  stream:
                                                      queryArtistFlashPostRecord(
                                                    queryBuilder:
                                                        (artistFlashPostRecord) =>
                                                            artistFlashPostRecord
                                                                .where(
                                                                  'uid',
                                                                  isEqualTo: widget
                                                                      .artistUID,
                                                                )
                                                                .orderBy(
                                                                    'timePosted',
                                                                    descending:
                                                                        true),
                                                    limit: 20,
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
                                                        gridViewArtistFlashPostRecordList =
                                                        snapshot.data!;

                                                    return GridView.builder(
                                                      padding: EdgeInsets.zero,
                                                      gridDelegate:
                                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        childAspectRatio: 1.0,
                                                      ),
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          gridViewArtistFlashPostRecordList
                                                              .length,
                                                      itemBuilder: (context,
                                                          gridViewIndex) {
                                                        final gridViewArtistFlashPostRecord =
                                                            gridViewArtistFlashPostRecordList[
                                                                gridViewIndex];
                                                        return Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            border: Border.all(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            child:
                                                                Image.network(
                                                              gridViewArtistFlashPostRecord
                                                                  .flashPhoto,
                                                              width: 200.0,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: StreamBuilder<
                                                    List<
                                                        ArtistPortfolioPostRecord>>(
                                                  stream:
                                                      queryArtistPortfolioPostRecord(
                                                    queryBuilder:
                                                        (artistPortfolioPostRecord) =>
                                                            artistPortfolioPostRecord
                                                                .where(
                                                                  'uid',
                                                                  isEqualTo: widget
                                                                      .artistUID,
                                                                )
                                                                .orderBy(
                                                                    'timePosted',
                                                                    descending:
                                                                        true),
                                                    limit: 20,
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
                                                    List<ArtistPortfolioPostRecord>
                                                        gridViewArtistPortfolioPostRecordList =
                                                        snapshot.data!;

                                                    return GridView.builder(
                                                      padding: EdgeInsets.zero,
                                                      gridDelegate:
                                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        childAspectRatio: 1.0,
                                                      ),
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          gridViewArtistPortfolioPostRecordList
                                                              .length,
                                                      itemBuilder: (context,
                                                          gridViewIndex) {
                                                        final gridViewArtistPortfolioPostRecord =
                                                            gridViewArtistPortfolioPostRecordList[
                                                                gridViewIndex];
                                                        return Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            border: Border.all(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            child:
                                                                Image.network(
                                                              gridViewArtistPortfolioPostRecord
                                                                  .portfolioPhoto,
                                                              width: 200.0,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
          ),
        );
      },
    );
  }
}
