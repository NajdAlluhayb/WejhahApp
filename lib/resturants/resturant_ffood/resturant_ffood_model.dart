import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'resturant_ffood_widget.dart' show ResturantFfoodWidget;
import 'package:flutter/material.dart';

class ResturantFfoodModel extends FlutterFlowModel<ResturantFfoodWidget> {
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
