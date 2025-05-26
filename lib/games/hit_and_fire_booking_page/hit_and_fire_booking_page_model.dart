import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'hit_and_fire_booking_page_widget.dart' show HitAndFireBookingPageWidget;
import 'package:flutter/material.dart';

class HitAndFireBookingPageModel
    extends FlutterFlowModel<HitAndFireBookingPageWidget> {
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
