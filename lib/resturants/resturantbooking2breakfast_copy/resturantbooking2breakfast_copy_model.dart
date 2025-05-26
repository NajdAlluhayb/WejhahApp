import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'resturantbooking2breakfast_copy_widget.dart'
    show Resturantbooking2breakfastCopyWidget;
import 'package:flutter/material.dart';

class Resturantbooking2breakfastCopyModel
    extends FlutterFlowModel<Resturantbooking2breakfastCopyWidget> {
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
