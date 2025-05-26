import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dressed_in_saudi_booking_page_widget.dart'
    show DressedInSaudiBookingPageWidget;
import 'package:flutter/material.dart';

class DressedInSaudiBookingPageModel
    extends FlutterFlowModel<DressedInSaudiBookingPageWidget> {
  ///  Local state fields for this page.

  String? selectedDay;

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
