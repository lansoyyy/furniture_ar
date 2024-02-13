import 'package:flutter/material.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:furniture_app/size_config.dart';

import 'product_description.dart';
import 'product_info.dart';

class Body extends StatelessWidget {
  var data;

  Body({required this.data});
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.orientation! == Orientation.landscape
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight! - AppBar().preferredSize.height,
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductInfo(product: data),
            Positioned(
              top: defaultSize * 37.5,
              left: 0,
              right: 0,
              child: ProductDescription(
                product: data['description'],
                press: () {},
              ),
            ),
            Positioned(
              top: defaultSize * 9.5,
              right: -defaultSize * 7.5,
              child: Hero(
                tag: product.id,
                child: Image.asset(
                  'assets/${data['name']}.png',
                  fit: BoxFit.cover,
                  height: defaultSize * 37.8, //378
                  width: defaultSize * 36.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
