import 'package:flutter/material.dart';
import 'package:furniture_app/components/title_text.dart';
import 'package:furniture_app/data/furniture_data.dart';
import 'package:furniture_app/models/Categories.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:furniture_app/screens/home/components/category_card.dart';
import 'package:furniture_app/screens/home/components/recommond_products.dart';
import 'package:furniture_app/size_config.dart';

import '../../../services/fetchProducts.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    // It enables scrolling
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child: TitleText(
                title: "Categories",
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryCard(
                        category: category,
                        name: 'Bed',
                        numbers:
                            '${allData.where((car) => car['category'] == 'Bed').length}',
                        image: 'assets/images/Poliform Bed.png'),
                    CategoryCard(
                        category: category,
                        name: 'Chairs',
                        numbers:
                            '${allData.where((car) => car['category'] == 'Armchair').length}',
                        image: 'assets/images/Blue Chair.png'),
                    CategoryCard(
                        category: category,
                        name: 'Sofa',
                        numbers:
                            '${allData.where((car) => car['category'] == 'Sofa').length}',
                        image: 'assets/images/Basic Sofa.png'),
                  ],
                )),
            Divider(height: 5),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child: TitleText(title: "Recommended For You"),
            ),
            FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? RecommandProducts(
                        products: snapshot.data as List<Product>)
                    : Center(child: Image.asset('assets/ripple.gif'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
