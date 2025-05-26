import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'log_in_pagevisitor_widget.dart' show LogInPagevisitorWidget;
import 'package:flutter/material.dart';

class LogInPagevisitorModel extends FlutterFlowModel<LogInPagevisitorWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField1 widget.
  FocusNode? textField1FocusNode;
  TextEditingController? textField1TextController;
  String? Function(BuildContext, String?)? textField1TextControllerValidator;
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
    textField1FocusNode?.dispose();
    textField1TextController?.dispose();

    textField2FocusNode?.dispose();
    textField2TextController?.dispose();
  }
}
