import '/flutter_flow/flutter_flow_util.dart';
import 'user_settings_widget.dart' show UserSettingsWidget;
import 'package:flutter/material.dart';

class UserSettingsModel extends FlutterFlowModel<UserSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for AddressField widget.
  FocusNode? addressFieldFocusNode;
  TextEditingController? addressFieldTextController;
  String? Function(BuildContext, String?)? addressFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    addressFieldFocusNode?.dispose();
    addressFieldTextController?.dispose();
  }
}