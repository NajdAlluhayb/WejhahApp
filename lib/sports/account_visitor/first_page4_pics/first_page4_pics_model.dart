import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'first_page4_pics_widget.dart' show FirstPage4PicsWidget;
import 'package:flutter/material.dart';

class FirstPage4PicsModel extends FlutterFlowModel<FirstPage4PicsWidget> {
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
