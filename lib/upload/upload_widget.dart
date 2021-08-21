import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class UploadWidget extends StatefulWidget {
  UploadWidget({Key key}) : super(key: key);

  @override
  _UploadWidgetState createState() => _UploadWidgetState();
}

class _UploadWidgetState extends State<UploadWidget> {
  String uploadedFileUrl = '';
  TextEditingController nameController;
  TextEditingController textController2;
  TextEditingController textController3;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment(0, -1),
                    children: [
                      Image.asset(
                        'assets/images/irene-kredenets-KStSiM1UvPw-unsplash@2x.jpg',
                        width: MediaQuery.of(context).size.width,
                        height: 530,
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment(0, 0.85),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 470, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            alignment: Alignment(0, 1),
                            child: Align(
                              alignment: Alignment(0, -0.15),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 16, 20, 12),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Product details',
                                              style: FlutterFlowTheme.title2
                                                  .override(
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 34, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                                child: IconButton(
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        duration: Duration(milliseconds: 300),
                                        reverseDuration:
                                            Duration(milliseconds: 300),
                                        child:
                                            NavBarPage(initialPage: 'HomePage'),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  iconSize: 30,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                                  child: Text(
                                    'Homepage',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Source Sans Pro',
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Please provide the details of the product you wish to upload.',
                      style: FlutterFlowTheme.bodyText2.override(
                        fontFamily: 'Source Sans Pro',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        controller: nameController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Name...',
                          labelStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Source Sans Pro',
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFDBE2E7),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFDBE2E7),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Source Sans Pro',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        controller: textController2,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Color...',
                          labelStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Source Sans Pro',
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFDBE2E7),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFDBE2E7),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Source Sans Pro',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        controller: textController3,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Price..',
                          labelStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Source Sans Pro',
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFDBE2E7),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFDBE2E7),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Source Sans Pro',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      final selectedMedia = await selectMedia();
                      if (selectedMedia != null &&
                          validateFileFormat(
                              selectedMedia.storagePath, context)) {
                        showUploadMessage(context, 'Uploading file...',
                            showLoading: true);
                        final downloadUrl = await uploadData(
                            selectedMedia.storagePath, selectedMedia.bytes);
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        if (downloadUrl != null) {
                          setState(() => uploadedFileUrl = downloadUrl);
                          showUploadMessage(context, 'Success!');
                        } else {
                          showUploadMessage(context, 'Failed to upload media');
                          return;
                        }
                      }
                    },
                    text: 'Upload Photo',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: Colors.white,
                      textStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF14181B),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      elevation: 2,
                      borderSide: BorderSide(
                        color: Color(0xFFDBE2E7),
                        width: 1,
                      ),
                      borderRadius: 8,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      final clothesCreateData = createClothesRecordData(
                        color: '',
                        name: '',
                        picture: uploadedFileUrl,
                        price: '',
                      );
                      await ClothesRecord.collection
                          .doc()
                          .set(clothesCreateData);
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 500),
                          reverseDuration: Duration(milliseconds: 500),
                          child: NavBarPage(initialPage: 'SearchResultPage'),
                        ),
                      );
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Product uploaded'),
                            content: Text('Seriously'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    text: 'Upload product',
                    options: FFButtonOptions(
                      width: 300,
                      height: 54,
                      color: Color(0xFF298758),
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 100,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
