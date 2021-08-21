import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../product_page/product_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class SearchResultPageWidget extends StatefulWidget {
  SearchResultPageWidget({Key key}) : super(key: key);

  @override
  _SearchResultPageWidgetState createState() => _SearchResultPageWidgetState();
}

class _SearchResultPageWidgetState extends State<SearchResultPageWidget> {
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
      backgroundColor: Color(0xFFEDEDED),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0x00FFFFFF),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.96,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Color(0xFFEEEEEE),
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                onTap: () async {
                                  setState(() => searchResults1 = null);
                                  await ClothesRecord.search(
                                    term: textController.text,
                                  )
                                      .then((r) => searchResults1 = r)
                                      .onError((_, __) => searchResults1 = [])
                                      .whenComplete(() => setState(() {}));
                                },
                                child: Icon(
                                  Icons.search,
                                  color: Color(0xFF95A1AC),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 2),
                                  child: TextFormField(
                                    onFieldSubmitted: (_) async {
                                      setState(() => searchResults2 = null);
                                      await ClothesRecord.search(
                                        term: textController.text,
                                      )
                                          .then((r) => searchResults2 = r)
                                          .onError(
                                              (_, __) => searchResults2 = [])
                                          .whenComplete(() => setState(() {}));
                                    },
                                    controller: textController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Search clothes here...',
                                      hintStyle:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Source Sans Pro',
                                        color: Color(0xFF95A1AC),
                                        fontSize: 16,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Source Sans Pro',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 16,
                                    ),
                                    keyboardType: TextInputType.name,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Builder(
                  builder: (context) {
                    if (searchResults1 == null) {
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
                    final clothes = searchResults1?.toList() ?? [];
                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 90,
                        childAspectRatio: 1,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: clothes.length,
                      itemBuilder: (context, clothesIndex) {
                        final clothesItem = clothes[clothesIndex];
                        return Container(
                          decoration: BoxDecoration(
                            color: Color(0x00EEEEEE),
                          ),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  duration: Duration(milliseconds: 300),
                                  reverseDuration: Duration(milliseconds: 300),
                                  child: ProductPageWidget(
                                    name: clothesItem.name,
                                    price: clothesItem.price,
                                    url: clothesItem.picture,
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.48,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                      borderRadius: BorderRadius.circular(0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.network(
                                        clothesItem.picture,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              clothesItem.name,
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Source Sans Pro',
                                                color: Color(0xFF298758),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment(0, 0),
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    100, 0, 0, 0),
                                                child: Icon(
                                                  Icons.favorite,
                                                  color: FlutterFlowTheme
                                                      .tertiaryColor,
                                                  size: 14,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.dollarSign,
                                              color: FlutterFlowTheme
                                                  .tertiaryColor,
                                              size: 12,
                                            ),
                                            Text(
                                              clothesItem.price,
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Source Sans Pro',
                                                color: FlutterFlowTheme
                                                    .tertiaryColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
