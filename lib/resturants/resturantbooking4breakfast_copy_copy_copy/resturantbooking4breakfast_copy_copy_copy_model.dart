import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'resturantbooking4breakfast_copy_copy_copy_widget.dart'
    show Resturantbooking4breakfastCopyCopyCopyWidget;
import 'package:flutter/material.dart';

class Resturantbooking4breakfastCopyCopyCopyModel
    extends FlutterFlowModel<Resturantbooking4breakfastCopyCopyCopyWidget> {
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
