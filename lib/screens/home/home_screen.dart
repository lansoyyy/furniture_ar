import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/screens/home/components/body.dart';
import 'package:furniture_app/size_config.dart';
import 'package:furniture_app/widgets/drawer_widget.dart';
import 'package:furniture_app/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It help us to  make our UI responsive
    SizeConfig().init(context);
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      leading: Builder(builder: (context) {
        return IconButton(
          icon: SvgPicture.asset(
            "assets/icons/menu.svg",
            height: SizeConfig.defaultSize! * 2, //20
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      }),
      title: TextBold(text: 'HOME', fontSize: 18, color: Colors.black),
      centerTitle: true,
    );
  }
}
