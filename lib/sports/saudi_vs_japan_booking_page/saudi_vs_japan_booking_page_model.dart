import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'saudi_vs_japan_booking_page_widget.dart'
    show SaudiVsJapanBookingPageWidget;
import 'package:flutter/material.dart';

class SaudiVsJapanBookingPageModel
    extends FlutterFlowModel<SaudiVsJapanBookingPageWidget> {
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
