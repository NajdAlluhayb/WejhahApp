import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'resturantbookingcoffee_widget.dart' show ResturantbookingcoffeeWidget;
import 'package:flutter/material.dart';

class ResturantbookingcoffeeModel
    extends FlutterFlowModel<ResturantbookingcoffeeWidget> {
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
