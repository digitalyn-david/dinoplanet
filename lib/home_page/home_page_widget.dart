import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  List<ClothesRecord> searchResults1 = [];
  List<ClothesRecord> searchResults2 = [];
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFEFDCD3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                  height: 250,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment(0, 0),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
                          child: Image.asset(
                            'assets/images/6ae5df97-2f01-4069-a980-0ec17af58c85.png',
                            width: double.infinity,
                            height: 450,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: Alignment(0, 0),
                                child: Text(
                                  'Dino                      Planet                       ',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Source Sans Pro',
                                    color: FlutterFlowTheme.secondaryColor,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 27, 0, 0),
                                child: Container(
                                  width: double.infinity,
                                  height: 52,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType
                                                    .bottomToTop,
                                                duration:
                                                    Duration(milliseconds: 300),
                                                reverseDuration:
                                                    Duration(milliseconds: 300),
                                                child: NavBarPage(
                                                    initialPage:
                                                        'SearchResultPage'),
                                              ),
                                            );
                                            setState(
                                                () => searchResults1 = null);
                                            await ClothesRecord.search(
                                              term: valueOrDefault<String>(
                                                textController.text,
                                                'Example',
                                              ),
                                            )
                                                .then((r) => searchResults1 = r)
                                                .onError((_, __) =>
                                                    searchResults1 = [])
                                                .whenComplete(
                                                    () => setState(() {}));
                                          },
                                          child: Icon(
                                            Icons.search,
                                            color:
                                                FlutterFlowTheme.tertiaryColor,
                                            size: 24,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(5, 0, 0, 2),
                                            child: TextFormField(
                                              onFieldSubmitted: (_) async {
                                                await Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    type: PageTransitionType
                                                        .bottomToTop,
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    reverseDuration: Duration(
                                                        milliseconds: 300),
                                                    child: NavBarPage(
                                                        initialPage:
                                                            'SearchResultPage'),
                                                  ),
                                                );
                                                setState(() =>
                                                    searchResults2 = null);
                                                await ClothesRecord.search(
                                                  term: valueOrDefault<String>(
                                                    textController.text,
                                                    'Example pressed by enter',
                                                  ),
                                                )
                                                    .then((r) =>
                                                        searchResults2 = r)
                                                    .onError((_, __) =>
                                                        searchResults2 = [])
                                                    .whenComplete(
                                                        () => setState(() {}));
                                              },
                                              controller: textController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: 'Search for T-shirts',
                                                hintStyle: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Source Sans Pro',
                                                  fontSize: 16,
                                                ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Source Sans Pro',
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(-1, 0),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 20),
                                  child: Text(
                                    'Products',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Source Sans Pro',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
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
                ),
              ),
              Align(
                alignment: Alignment(0, 0),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.89,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x2E000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                child: Image.asset(
                                  'assets/images/Hat_bicolor.png',
                                  height: 200,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(12, 8, 12, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/user_2@2x.png',
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                                      child: Text(
                                        'Sunshine',
                                        style: FlutterFlowTheme.title2.override(
                                          fontFamily: 'Open Sans',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                                      child: Text(
                                        '2h',
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF8B97A2),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(12, 4, 12, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 8),
                                        child: Text(
                                          'We made an example webshop. There are some products and functioning shopping functions. We also present you a working searching field.',
                                          style: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF8B97A2),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                height: 3,
                                thickness: 1,
                                color: Color(0xFFE1E4E5),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(16, 0, 16, 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 16, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.favorite_border,
                                                color: FlutterFlowTheme
                                                    .tertiaryColor,
                                                size: 24,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    4, 0, 0, 0),
                                                child: Text(
                                                  '2,493',
                                                  style: FlutterFlowTheme
                                                      .bodyText2
                                                      .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF8B97A2),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.mode_comment_outlined,
                                              color: Color(0xFF95A1AC),
                                              size: 24,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 0, 0, 0),
                                              child: Text(
                                                '4',
                                                style: FlutterFlowTheme
                                                    .bodyText2
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF8B97A2),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.shopping_cart_outlined,
                                          color: Color(0xFF95A1AC),
                                          size: 24,
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
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
