import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'escape_the_room_booking_page_widget.dart'
    show EscapeTheRoomBookingPageWidget;
import 'package:flutter/material.dart';

class EscapeTheRoomBookingPageModel
    extends FlutterFlowModel<EscapeTheRoomBookingPageWidget> {
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
