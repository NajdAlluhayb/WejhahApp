import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'saudi_culture_l_i_s_tbrowes_widget.dart'
    show SaudiCultureLISTbrowesWidget;
import 'package:flutter/material.dart';

class SaudiCultureLISTbrowesModel
    extends FlutterFlowModel<SaudiCultureLISTbrowesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();

    tabBarController?.dispose();
  }
}
