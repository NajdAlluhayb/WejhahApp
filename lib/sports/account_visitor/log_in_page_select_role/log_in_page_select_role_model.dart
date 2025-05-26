import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'log_in_page_select_role_widget.dart' show LogInPageSelectRoleWidget;
import 'package:flutter/material.dart';

class LogInPageSelectRoleModel
    extends FlutterFlowModel<LogInPageSelectRoleWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
