import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'resturantbooking3breakfast_copy_copy_widget.dart'
    show Resturantbooking3breakfastCopyCopyWidget;
import 'package:flutter/material.dart';

class Resturantbooking3breakfastCopyCopyModel
    extends FlutterFlowModel<Resturantbooking3breakfastCopyCopyWidget> {
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
