import 'package:flutter/material.dart';
import 'package:furniture_app/size_config.dart';

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
          ],
        ),
      ),
    );
  }
}
