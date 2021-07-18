import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class DepartmentHighlightsPageWidget extends StatefulWidget {
  DepartmentHighlightsPageWidget({
    Key key,
    this.departmentId,
    this.displayName,
  }) : super(key: key);

  final int departmentId;
  final String displayName;

  @override
  _DepartmentHighlightsPageWidgetState createState() =>
      _DepartmentHighlightsPageWidgetState();
}

class _DepartmentHighlightsPageWidgetState
    extends State<DepartmentHighlightsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: Text(
          widget.displayName,
          style: FlutterFlowTheme.bodyText2.override(
            fontFamily: 'Source Sans Pro',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.secondaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [],
      ),
    );
  }
}
