import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ARView extends StatelessWidget {
  const ARView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Model Viewer')),
        body: Stack(
          children: [
            MaterialButton(
              onPressed: () {},
            ),
            const ModelViewer(
              backgroundColor: Colors.transparent,
              src: 'assets/sofa/1.glb',
              alt: 'A 3D model of an astronaut',
              ar: true,
              autoRotate: true,
              iosSrc:
                  'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
              disableZoom: true,
            ),
          ],
        ),
      ),
    );
  }
}
