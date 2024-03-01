import 'package:flutter/material.dart';
import 'package:furniture_app/data/furniture_data.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:furniture_app/screens/details/details_screen.dart';

import '../../../components/title_text.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class RecommandProducts extends StatelessWidget {
  const RecommandProducts({
    required this.products,
  }) : super();
  // Because our Api provie us list of products
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    return Padding(
      padding: EdgeInsets.all(defaultSize * 2), //20
      child: GridView.builder(
          // We just turn off grid view scrolling
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          // just for demo
          itemCount: allData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                SizeConfig.orientation == Orientation.portrait ? 2 : 4,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.693,
          ),
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          data: allData[index],
                        ),
                      ));
                },
                child: Container(
                  width: defaultSize * 14.5, //145
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: AspectRatio(
                    aspectRatio: 0.693,
                    child: Column(
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 1,
                          child: Hero(
                            tag: product.id,
                            child: Image.asset(
                              '${allData[index]['image']!}.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultSize),
                          child: TitleText(title: allData[index]['name']!),
                        ),
                        SizedBox(height: defaultSize / 2),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
