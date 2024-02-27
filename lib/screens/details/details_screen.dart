import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/constants.dart';

import 'package:furniture_app/size_config.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  var data;

  DetailsScreen({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: buildAppBar(context),
      body: Stack(
        children: [
          ModelViewer(
            backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
            src: 'assets/sofa/Astronaut.glb',
            alt: 'A 3D model of an astronaut',
            ar: true,
            autoRotate: true,
            iosSrc:
                'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
            disableZoom: true,
          ),
          Body(
            data: data,
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/arrow-long-left.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
