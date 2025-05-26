import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'detailsevent_clouds_widget.dart' show DetailseventCloudsWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class DetailseventCloudsModel
    extends FlutterFlowModel<DetailseventCloudsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
