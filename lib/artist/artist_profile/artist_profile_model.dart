import '/flutter_flow/flutter_flow_util.dart';
import 'artist_profile_widget.dart' show ArtistProfileWidget;
import 'package:flutter/material.dart';

class ArtistProfileModel extends FlutterFlowModel<ArtistProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
