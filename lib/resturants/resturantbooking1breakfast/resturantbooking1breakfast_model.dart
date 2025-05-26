import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'resturantbooking1breakfast_widget.dart'
    show Resturantbooking1breakfastWidget;
import 'package:flutter/material.dart';

class Resturantbooking1breakfastModel
    extends FlutterFlowModel<Resturantbooking1breakfastWidget> {
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
