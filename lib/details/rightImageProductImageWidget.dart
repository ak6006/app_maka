import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maka/details/blubutton.dart';
import 'package:maka/details/products.dart';
import 'package:maka/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
//import '../../models/product.dart';
//import 'blue_button.dart';

class RightImageProductImageWidget extends StatefulWidget {
  const RightImageProductImageWidget({
    Key key,
    @required this.screenHeight,
    @required this.product,
    this.orderproductItems,
  }) : super(key: key);

  final double screenHeight;
  final Product product;
  final DropDownItem orderproductItems;

  @override
  _RightImageProductImageWidgetState createState() =>
      _RightImageProductImageWidgetState();
}

class _RightImageProductImageWidgetState
    extends State<RightImageProductImageWidget> {
  TransformationController controller = TransformationController();
  bool tr = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.product.backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.only(left: 7),
      height: widget.screenHeight * 0.2,
      // color: product.backgroundColor,
      child: Stack(
        children: <Widget>[
          Container(
            // width: 180,
            //  flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: 210,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  //  color: Colors.blue[400],
                  child: Text(
                    widget.product.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 14.0,
                      fontFamily: 'beIN',
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                Container(
                  height: 120,
                  width: 120,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    //   color: Colors.white10,
                    image: DecorationImage(
                      image: AssetImage("assets/images/pr2.png"),
                      fit: BoxFit.cover,
                      // matchTextDirection: true,
                    ),
                  ),
                  child: Text(
                    'سعر اليوم \n${widget.product.description}',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 14.0,
                        fontFamily: 'beIN',
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                BlueButton(
                  product: widget.product,
                  orderproductItems: widget.orderproductItems,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Stack(
              //   children: <Widget>[],
              // ),
              // Expanded(
              //   //  flex: 4,
              //   child: Container(),
              // ),
              Container(
                child: Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(100, 40, 0, 0),
                    child: Transform.rotate(
                      angle: -0.3,
                      child: InteractiveViewer(
                        onInteractionStart: (kk) {
                          // defval = kk.;
                        },
                        onInteractionEnd: (ScaleEndDetails endDetails) {
                          controller.value = Matrix4.identity();
                        },
                        transformationController: controller,
                        child: CachedNetworkImage(
                          placeholder: (context, url) =>
                              Image.asset('assets/images/Loading.jpg'),
                          // CircularProgressIndicator(),
                          imageUrl: widget.product.imagePath,
                          // widget.product.imagePath, //
                        ),

                        // vaildurl(widget.product.imagePath) != null
                        //     ? buildCachedNetworkImage()
                        //     : Container(
                        //         height: 60,
                        //         child: Center(
                        //           child: CircularProgressIndicator(),
                        //         ),
                        //       ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  buildCachedNetworkImage() {
    // vaildurl(widget.product.imagePath).then(() {
    //   print('hhhhh');
    // });
    String temp =
        widget.product.imagePath; //await vaildurl(widget.product.imagePath);
    try {
      return CachedNetworkImage(
        placeholder: (context, url) => Image.asset('assets/images/Loading.gif'),
        // CircularProgressIndicator(),
        imageUrl: temp,
        // widget.product.imagePath, //
      );
    } catch (exception) {
      print('bbbbbbbbbbb${exception}');
      return CachedNetworkImage(
        placeholder: (context, url) => Image.asset('assets/images/Loading.gif'),
        // CircularProgressIndicator(),
        imageUrl: 'http://teamiegypt-001-site1.atempurl.com/imgs/product_1.png',
        // widget.product.imagePath, //
      );
    }
  }

  Future<String> vaildurl() async {
    final response = await http.get(widget.product.imagePath);

    if (response.statusCode == 200) {
      return widget.product.imagePath;
    } else {
      return 'http://teamiegypt-001-site1.atempurl.com/imgs/product_1.png';
    }
  }
}
