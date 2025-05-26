import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'poetry_in_motion_booking_page_widget.dart'
    show PoetryInMotionBookingPageWidget;
import 'package:flutter/material.dart';

class PoetryInMotionBookingPageModel
    extends FlutterFlowModel<PoetryInMotionBookingPageWidget> {
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
