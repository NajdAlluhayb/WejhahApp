import '/components/scrolldate_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_booking_page_widget.dart' show NewBookingPageWidget;
import 'package:flutter/material.dart';

class NewBookingPageModel extends FlutterFlowModel<NewBookingPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for scrolldate component.
  late ScrolldateModel scrolldateModel1;
  // Model for scrolldate component.
  late ScrolldateModel scrolldateModel2;

  @override
  void initState(BuildContext context) {
    scrolldateModel1 = createModel(context, () => ScrolldateModel());
    scrolldateModel2 = createModel(context, () => ScrolldateModel());
  }

  @override
  void dispose() {
    scrolldateModel1.dispose();
    scrolldateModel2.dispose();
  }
}
