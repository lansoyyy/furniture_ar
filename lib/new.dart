import 'package:flutter/material.dart';
import 'dart:async';

import 'package:sceneview_flutter/sceneview_flutter.dart';

class New extends StatefulWidget {
  const New({super.key});

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  SceneViewController _controller = SceneViewController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      if (!mounted) return;

      _controller.displayDemo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Scene view example app'),
        ),
        body: SceneView(_controller),
      ),
    );
  }
}
