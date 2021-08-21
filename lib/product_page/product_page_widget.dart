import '../cart_page/cart_page_widget.dart';
import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ProductPageWidget extends StatefulWidget {
  ProductPageWidget({
    Key key,
    this.name,
    this.price,
    this.url,
    this.color,
  }) : super(key: key);

  final String name;
  final String price;
  final String url;
  final String color;

  @override
  _ProductPageWidgetState createState() => _ProductPageWidgetState();
}

class _ProductPageWidgetState extends State<ProductPageWidget> {
  String dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: Color(0xFF8B97A2),
            size: 24,
          ),
        ),
        title: Text(
          ' ',
          style: FlutterFlowTheme.subtitle2.override(
            fontFamily: 'Lexend Deca',
            color: Color(0xFF151B1E),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: IconButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.leftToRight,
                    duration: Duration(milliseconds: 300),
                    reverseDuration: Duration(milliseconds: 300),
                    child: NavBarPage(initialPage: 'CartPage'),
                  ),
                );
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Color(0xFF95A1AC),
                size: 30,
              ),
              iconSize: 30,
            ),
          )
        ],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.network(
                        widget.url,
                        width: MediaQuery.of(context).size.width,
                        height: 350,
                        fit: BoxFit.fitHeight,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          widget.name,
                          style: FlutterFlowTheme.title1.override(
                            fontFamily: 'Roboto',
                            color: Color(0xFF090F13),
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            widget.price,
                            textAlign: TextAlign.end,
                            style: FlutterFlowTheme.subtitle1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF298758),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                              style: FlutterFlowTheme.bodyText2.override(
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: FlutterFlowDropDown(
                              options: ['Small', 'Medium', 'Large'].toList(),
                              onChanged: (value) {
                                setState(() => dropDownValue = value);
                              },
                              width: 130,
                              height: 50,
                              textStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF090F13),
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                              icon: Icon(
                                Icons.arrow_drop_down_rounded,
                                color: Color(0xFF95A1AC),
                                size: 15,
                              ),
                              fillColor: Colors.white,
                              elevation: 2,
                              borderColor: Color(0xFFDBE2E7),
                              borderWidth: 2,
                              borderRadius: 8,
                              margin: EdgeInsets.fromLTRB(24, 4, 8, 4),
                              hidesUnderline: true,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: Color(0xFFDBE2E7),
                              width: 2,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.minus,
                              color: Color(0xFF8B97A2),
                              size: 20,
                            ),
                            iconSize: 20,
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          alignment: Alignment(0, 0.1499999999999999),
                          child: Align(
                            alignment: Alignment(0, 0.05),
                            child: AutoSizeText(
                              '1',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.title1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF090F13),
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: Color(0xFFDBE2E7),
                              width: 2,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                            icon: Icon(
                              Icons.add,
                              color: Color(0xFF8B97A2),
                              size: 30,
                            ),
                            iconSize: 30,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.leftToRight,
                                duration: Duration(milliseconds: 300),
                                reverseDuration: Duration(milliseconds: 300),
                                child: CartPageWidget(
                                  name: widget.name,
                                  color: widget.name,
                                  price: widget.price,
                                  picture: widget.url,
                                ),
                              ),
                            );
                          },
                          text: 'Add to Cart',
                          options: FFButtonOptions(
                            color: Color(0xFF298758),
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
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
            )
          ],
        ),
      ),
    );
  }
}
