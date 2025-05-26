import '/flutter_flow/flutter_flow_util.dart';
import 'create_account2_copy2_widget.dart' show CreateAccount2Copy2Widget;
import 'package:flutter/material.dart';

class CreateAccount2Copy2Model
    extends FlutterFlowModel<CreateAccount2Copy2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for visitor widget.
  FocusNode? visitorFocusNode;
  TextEditingController? visitorTextController;
  String? Function(BuildContext, String?)? visitorTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for Confirmpassword widget.
  FocusNode? confirmpasswordFocusNode;
  TextEditingController? confirmpasswordTextController;
  late bool confirmpasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmpasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    confirmpasswordVisibility = false;
  }

  @override
  void dispose() {
    visitorFocusNode?.dispose();
    visitorTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    confirmpasswordFocusNode?.dispose();
    confirmpasswordTextController?.dispose();
  }
}
