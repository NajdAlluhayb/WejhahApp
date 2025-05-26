import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'fragrance_of_the_kingdoom_booking_page_widget.dart'
    show FragranceOfTheKingdoomBookingPageWidget;
import 'package:flutter/material.dart';

class FragranceOfTheKingdoomBookingPageModel
    extends FlutterFlowModel<FragranceOfTheKingdoomBookingPageWidget> {
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
