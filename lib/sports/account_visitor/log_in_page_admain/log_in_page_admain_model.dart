import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'log_in_page_admain_widget.dart' show LogInPageAdmainWidget;
import 'package:flutter/material.dart';

class LogInPageAdmainModel extends FlutterFlowModel<LogInPageAdmainWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField2 widget.
  FocusNode? textField2FocusNode;
  TextEditingController? textField2TextController;
  late bool textField2Visibility;
  String? Function(BuildContext, String?)? textField2TextControllerValidator;

  @override
  void initState(BuildContext context) {
    textField2Visibility = false;
  }

  @override
  void dispose() {
    textField2FocusNode?.dispose();
    textField2TextController?.dispose();
  }
}
