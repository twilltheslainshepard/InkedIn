import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'appointment_picker_widget.dart' show AppointmentPickerWidget;
import 'package:flutter/material.dart';

class AppointmentPickerModel extends FlutterFlowModel<AppointmentPickerWidget> {
  ///  State fields for stateful widgets in this component.

  DateTime? datePicked;
  // Stores action output result for [Backend Call - API (sendEmailToUser Cloud Functions API)] action in appointmentButton widget.
  ApiCallResponse? apiResultaf3;
  // Stores action output result for [Backend Call - API (sendEmail to artist)] action in appointmentButton widget.
  ApiCallResponse? apiResultdn4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
