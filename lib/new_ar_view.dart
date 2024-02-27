import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class HelloWorld1 extends StatefulWidget {
  String image;

  HelloWorld1({
    required this.image,
  });

  @override
  _HelloWorld1State createState() => _HelloWorld1State();
}

class _HelloWorld1State extends State<HelloWorld1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Model Viewer')),
      body: ModelViewer(
        backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
        src: 'assets/sofa/Astronaut.glb',
        alt: 'A 3D model of an astronaut',
        ar: true,
        autoRotate: true,
        iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
        disableZoom: true,
      ),
    );
  }
}
