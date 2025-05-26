import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'resturant_list_mfood_copy2_widget.dart'
    show ResturantListMfoodCopy2Widget;
import 'package:flutter/material.dart';

class ResturantListMfoodCopy2Model
    extends FlutterFlowModel<ResturantListMfoodCopy2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
