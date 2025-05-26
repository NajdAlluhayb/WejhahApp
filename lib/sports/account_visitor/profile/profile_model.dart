import '/components/light_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for light component.
  late LightModel lightModel;

  @override
  void initState(BuildContext context) {
    lightModel = createModel(context, () => LightModel());
  }

  @override
  void dispose() {
    lightModel.dispose();
  }
}
