import '/flutter_flow/flutter_flow_util.dart';
import 'signup_page_widget.dart' show SignupPageWidget;
import 'package:flutter/material.dart';

class SignupPageModel extends FlutterFlowModel<SignupPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Signup-Email widget.
  FocusNode? signupEmailFocusNode;
  TextEditingController? signupEmailTextController;
  String? Function(BuildContext, String?)? signupEmailTextControllerValidator;
  // State field(s) for Signup-Password widget.
  FocusNode? signupPasswordFocusNode;
  TextEditingController? signupPasswordTextController;
  late bool signupPasswordVisibility;
  String? Function(BuildContext, String?)?
      signupPasswordTextControllerValidator;
  // State field(s) for ConfirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordTextController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    signupPasswordVisibility = false;
    confirmPasswordVisibility = false;
  }

  @override
  void dispose() {
    signupEmailFocusNode?.dispose();
    signupEmailTextController?.dispose();

    signupPasswordFocusNode?.dispose();
    signupPasswordTextController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();
  }
}
