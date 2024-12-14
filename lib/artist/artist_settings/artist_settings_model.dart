import '/flutter_flow/flutter_flow_util.dart';
import 'artist_settings_widget.dart' show ArtistSettingsWidget;
import 'package:flutter/material.dart';

class ArtistSettingsModel extends FlutterFlowModel<ArtistSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for usernameField widget.
  FocusNode? usernameFieldFocusNode;
  TextEditingController? usernameFieldTextController;
  String? Function(BuildContext, String?)? usernameFieldTextControllerValidator;
  // State field(s) for tattooshopField widget.
  FocusNode? tattooshopFieldFocusNode;
  TextEditingController? tattooshopFieldTextController;
  String? Function(BuildContext, String?)?
      tattooshopFieldTextControllerValidator;
  // State field(s) for tattooAddressField widget.
  FocusNode? tattooAddressFieldFocusNode;
  TextEditingController? tattooAddressFieldTextController;
  String? Function(BuildContext, String?)?
      tattooAddressFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    usernameFieldFocusNode?.dispose();
    usernameFieldTextController?.dispose();

    tattooshopFieldFocusNode?.dispose();
    tattooshopFieldTextController?.dispose();

    tattooAddressFieldFocusNode?.dispose();
    tattooAddressFieldTextController?.dispose();
  }
}
