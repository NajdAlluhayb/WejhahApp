import '/components/backbutton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'events_history_widget.dart' show EventsHistoryWidget;
import 'package:flutter/material.dart';

class EventsHistoryModel extends FlutterFlowModel<EventsHistoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for backbutton component.
  late BackbuttonModel backbuttonModel;

  @override
  void initState(BuildContext context) {
    backbuttonModel = createModel(context, () => BackbuttonModel());
  }

  @override
  void dispose() {
    backbuttonModel.dispose();
  }
}
