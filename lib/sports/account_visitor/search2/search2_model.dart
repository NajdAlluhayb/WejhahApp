import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search2_widget.dart' show Search2Widget;
import 'package:flutter/material.dart';

class Search2Model extends FlutterFlowModel<Search2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<EventsRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
  }
}
