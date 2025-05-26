import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'la_vie_en_ward_booking_page_widget.dart'
    show LaVieEnWardBookingPageWidget;
import 'package:flutter/material.dart';

class LaVieEnWardBookingPageModel
    extends FlutterFlowModel<LaVieEnWardBookingPageWidget> {
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
