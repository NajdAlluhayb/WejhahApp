import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'creat_acc_visitor_widget.dart' show CreatAccVisitorWidget;
import 'package:flutter/material.dart';

class CreatAccVisitorModel extends FlutterFlowModel<CreatAccVisitorWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Text1Name widget.
  FocusNode? text1NameFocusNode;
  TextEditingController? text1NameTextController;
  String? Function(BuildContext, String?)? text1NameTextControllerValidator;
  // State field(s) for Text2 widget.
  FocusNode? text2FocusNode;
  TextEditingController? text2TextController;
  String? Function(BuildContext, String?)? text2TextControllerValidator;
  // State field(s) for Text3 widget.
  FocusNode? text3FocusNode;
  TextEditingController? text3TextController;
  late bool text3Visibility;
  String? Function(BuildContext, String?)? text3TextControllerValidator;
  // State field(s) for Text4 widget.
  FocusNode? text4FocusNode;
  TextEditingController? text4TextController;
  late bool text4Visibility;
  String? Function(BuildContext, String?)? text4TextControllerValidator;

  @override
  void initState(BuildContext context) {
    text3Visibility = false;
    text4Visibility = false;
  }

  @override
  void dispose() {
    text1NameFocusNode?.dispose();
    text1NameTextController?.dispose();

    text2FocusNode?.dispose();
    text2TextController?.dispose();

    text3FocusNode?.dispose();
    text3TextController?.dispose();

    text4FocusNode?.dispose();
    text4TextController?.dispose();
  }
}
