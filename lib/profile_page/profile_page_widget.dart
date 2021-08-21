import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../login_page/login_page_widget.dart';
import '../main.dart';
import '../upload/upload_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ProfilePageWidget extends StatefulWidget {
  ProfilePageWidget({Key key}) : super(key: key);

  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  String uploadedFileUrl = '';
  TextEditingController textController1;
  TextEditingController emailAddressController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: SpinKitFoldingCube(
                color: Color(0xFFEED3AE),
                size: 40,
              ),
            ),
          );
        }
        final profilePageUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.leftToRight,
                    duration: Duration(milliseconds: 300),
                    reverseDuration: Duration(milliseconds: 300),
                    child: NavBarPage(initialPage: 'HomePage'),
                  ),
                );
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 24,
              ),
            ),
            title: Text(
              'Edit Profile',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF14181B),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        alignment:
                            Alignment(0.3999999999999999, 0.19999999999999996),
                        child: Align(
                          alignment: Alignment(-0.05, -1),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  duration: Duration(milliseconds: 300),
                                  reverseDuration: Duration(milliseconds: 300),
                                  child: UploadWidget(),
                                ),
                              );
                            },
                            text: 'Admin',
                            options: FFButtonOptions(
                              width: 80,
                              height: 35,
                              color: Colors.white,
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF14181B),
                                fontSize: 14,
                              ),
                              elevation: 2,
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 1,
                              ),
                              borderRadius: 8,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(1, -0.85),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Align(
                            alignment: Alignment(-0.05, -1),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await signOut();
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: LoginPageWidget(),
                                  ),
                                  (r) => false,
                                );
                              },
                              text: 'Log out',
                              options: FFButtonOptions(
                                width: 80,
                                height: 35,
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF14181B),
                                  fontSize: 14,
                                ),
                                elevation: 2,
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 1,
                                ),
                                borderRadius: 8,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFFDBE2E7),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                        child: Container(
                          width: 90,
                          height: 90,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CachedNetworkImage(
                            imageUrl: profilePageUsersRecord.photoUrl,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                              showUploadMessage(
                                  context, 'Failed to upload media');
                              return;
                            }
                          }

                          final usersUpdateData = createUsersRecordData(
                            photoUrl: uploadedFileUrl,
                          );
                          await profilePageUsersRecord.reference
                              .update(usersUpdateData);
                        },
                        text: 'Change Photo',
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
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 16),
                  child: TextFormField(
                    controller: textController1 ??= TextEditingController(
                      text: profilePageUsersRecord.displayName,
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF95A1AC),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      hintText: 'Your full name...',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF95A1AC),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFDBE2E7),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFDBE2E7),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.fromLTRB(20, 24, 0, 24),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF14181B),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 12),
                  child: TextFormField(
                    controller: emailAddressController ??=
                        TextEditingController(
                      text: profilePageUsersRecord.email,
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF95A1AC),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      hintText: 'Your email..',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF95A1AC),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFDBE2E7),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFDBE2E7),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.fromLTRB(20, 24, 0, 24),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF14181B),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.05),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final usersUpdateData = createUsersRecordData(
                          displayName: textController1?.text ?? '',
                          email: emailAddressController?.text ?? '',
                          photoUrl: uploadedFileUrl,
                          uid: '',
                        );
                        await profilePageUsersRecord.reference
                            .update(usersUpdateData);
                      },
                      text: 'Save Changes',
                      options: FFButtonOptions(
                        width: 340,
                        height: 60,
                        color: Colors.black,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        elevation: 2,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 8,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
