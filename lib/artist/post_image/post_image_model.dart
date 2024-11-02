import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'post_image_widget.dart' show PostImageWidget;
import 'package:flutter/material.dart';

class PostImageModel extends FlutterFlowModel<PostImageWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for titleBox widget.
  FocusNode? titleBoxFocusNode;
  TextEditingController? titleBoxTextController;
  String? Function(BuildContext, String?)? titleBoxTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for descriptionBox widget.
  FocusNode? descriptionBoxFocusNode;
  TextEditingController? descriptionBoxTextController;
  String? Function(BuildContext, String?)?
      descriptionBoxTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleBoxFocusNode?.dispose();
    titleBoxTextController?.dispose();

    descriptionBoxFocusNode?.dispose();
    descriptionBoxTextController?.dispose();
  }
}
