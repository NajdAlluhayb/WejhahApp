import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'resturant_list_mfood_copy_widget.dart'
    show ResturantListMfoodCopyWidget;
import 'package:flutter/material.dart';

class ResturantListMfoodCopyModel
    extends FlutterFlowModel<ResturantListMfoodCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
