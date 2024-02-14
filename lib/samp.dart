import 'package:ar_core/augmented_reality/augmented_preview.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

// dart pub publish // to publish package
class HelloWorld extends StatefulWidget {
  final String image;
  HelloWorld(this.image);
  @override
  _HelloWorldState createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  var controller;
  List<CameraDescription> cameras = [];
  bool loadingCamera = false;
  void loadCamera() async {
    setState(() {
      loadingCamera = true; //
    });
    try {
      cameras = await availableCameras();
      controller = CameraController(cameras[0], ResolutionPreset.ultraHigh);
      await controller.initialize();
      setState(() {
        loadingCamera = false;
      });

      print('controller value');
      print(controller.toString());
    } catch (e) {
      setState(() {
        loadingCamera = false;
      });
      print(e.toString());
    }

    /// Timer
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCamera();
  }

  double xPosition = 130;
  double yPosition = 150;
  double height = 150;
  double onchange = 150;

  double rotation = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loadingCamera
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                Container(
                    height: 1000,
                    width: MediaQuery.of(context).size.width,
                    child: ArWidget(controller)),
                Positioned(
                  top: yPosition,
                  left: xPosition,
                  child: GestureDetector(
                    onPanUpdate: (tapInfo) {
                      setState(() {
                        xPosition += tapInfo.delta.dx;
                        yPosition += tapInfo.delta.dy;
                      });
                    },
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationZ(
                        rotation.toDouble(),
                      ),
                      child: Container(
                          height: onchange,
                          child: Image.asset(
                            widget.image,
                            height: onchange,
                            width: onchange,
                          )),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 75,
                    left: 0,
                    right: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text('Zoom controls'),
                        ),
                        Slider(
                          value: onchange,
                          min: 10,
                          max: 300,
                          onChanged: (value) {
                            setState(() {
                              onchange = value;
                            });
                          },
                        ),
                      ],
                    )),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text('Rotation controls'),
                        ),
                        Slider(
                          value: rotation,
                          min: 1,
                          max: 10,
                          onChanged: (value) {
                            setState(() {
                              rotation = value.toDouble();
                            });
                          },
                        ),
                      ],
                    ))
              ],
            ),
    );
  }
}
