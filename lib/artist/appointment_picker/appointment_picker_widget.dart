import '/artist/confirmation_sheet/confirmation_sheet_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'appointment_picker_model.dart';
export 'appointment_picker_model.dart';

class AppointmentPickerWidget extends StatefulWidget {
  const AppointmentPickerWidget({
    super.key,
    this.artistEmail,
    this.userEmail,
  });

  final String? artistEmail;
  final String? userEmail;

  @override
  State<AppointmentPickerWidget> createState() =>
      _AppointmentPickerWidgetState();
}

class _AppointmentPickerWidgetState extends State<AppointmentPickerWidget> {
  late AppointmentPickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppointmentPickerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.arrow_back,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'APPOINTMENT_PICKER_arrow_back_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_bottom_sheet');
                          Navigator.pop(context);
                          if ((_model.apiResultdn4?.succeeded ?? true)) {
                            logFirebaseEvent('IconButton_wait__delay');
                            await Future.delayed(
                                const Duration(milliseconds: 2000));
                            logFirebaseEvent('IconButton_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: const ConfirmationSheetWidget(),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          }
                        },
                      ),
                      Expanded(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 24.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                dateTimeFormat("M/d H:mm", _model.datePicked),
                                'Time Picked: ',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Select Time',
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Inter Tight',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    'Choose when you\'d like to get inked',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ].divide(const SizedBox(height: 8.0)),
              ),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('APPOINTMENT_PICKER_SELECT_TIME_BTN_ON_TA');
                  logFirebaseEvent('Button_date_time_picker');

                  final datePickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(getCurrentTimestamp),
                    builder: (context, child) {
                      return wrapInMaterialTimePickerTheme(
                        context,
                        child!,
                        headerBackgroundColor: const Color(0x00000000),
                        headerForegroundColor: const Color(0x00000000),
                        headerTextStyle: const TextStyle(),
                        pickerBackgroundColor:
                            FlutterFlowTheme.of(context).secondary,
                        pickerForegroundColor:
                            FlutterFlowTheme.of(context).tertiary,
                        selectedDateTimeBackgroundColor:
                            FlutterFlowTheme.of(context).primary,
                        selectedDateTimeForegroundColor:
                            FlutterFlowTheme.of(context).accent1,
                        actionButtonForegroundColor:
                            FlutterFlowTheme.of(context).tertiary,
                        iconSize: 24,
                      );
                    },
                  );
                  if (datePickedTime != null) {
                    safeSetState(() {
                      _model.datePicked = DateTime(
                        getCurrentTimestamp.year,
                        getCurrentTimestamp.month,
                        getCurrentTimestamp.day,
                        datePickedTime.hour,
                        datePickedTime.minute,
                      );
                    });
                  }
                  logFirebaseEvent('Button_backend_call');

                  await currentUserReference!.update(createUsersRecordData(
                    appointment: dateTimeFormat("M/d H:mm", _model.datePicked),
                  ));
                },
                text: 'Select Time',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter Tight',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('APPOINTMENT_PICKER_appointmentButton_ON_');
                  var shouldSetState = false;
                  logFirebaseEvent('appointmentButton_backend_call');
                  _model.apiResultaf3 =
                      await SendEmailToUserCloudFunctionsAPICall.call(
                    userEmail: valueOrDefault<String>(
                      currentUserEmail,
                      'defaultUserEmail',
                    ),
                  );

                  shouldSetState = true;
                  if ((_model.apiResultaf3?.succeeded ?? true)) {
                    logFirebaseEvent('appointmentButton_backend_call');
                    _model.apiResultdn4 = await SendEmailToArtistCall.call(
                      artistEmail: widget.artistEmail,
                    );

                    shouldSetState = true;
                    if ((_model.apiResultdn4?.succeeded ?? true)) {
                      logFirebaseEvent('appointmentButton_navigate_to');

                      context.pushNamed('userProfile');
                    } else {
                      if (shouldSetState) safeSetState(() {});
                      return;
                    }
                  } else {
                    if (shouldSetState) safeSetState(() {});
                    return;
                  }

                  if (shouldSetState) safeSetState(() {});
                },
                text: 'Book Appointment',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter Tight',
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ].divide(const SizedBox(height: 20.0)),
          ),
        ),
      ),
    );
  }
}