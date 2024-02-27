import 'package:flutter/material.dart';
import 'package:furniture_app/size_config.dart';

import 'product_info.dart';

class Body extends StatelessWidget {
  var data;

  Body({required this.data});
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    return SizedBox(
      width: double.infinity,
      height: 2000,
      child: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              color: Colors.white.withOpacity(0.80),
              child: ProductInfo(product: data)),
        ],
      ),
    );
  }
}
