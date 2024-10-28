import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'explore_page_widget.dart' show ExplorePageWidget;
import 'package:flutter/material.dart';

class ExplorePageModel extends FlutterFlowModel<ExplorePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for FilterDropDown widget.
  String? filterDropDownValue;
  FormFieldController<String>? filterDropDownValueController;
  // State field(s) for SearchBarTextField widget.
  FocusNode? searchBarTextFieldFocusNode;
  TextEditingController? searchBarTextFieldTextController;
  String? Function(BuildContext, String?)?
      searchBarTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBarTextFieldFocusNode?.dispose();
    searchBarTextFieldTextController?.dispose();
  }
}
