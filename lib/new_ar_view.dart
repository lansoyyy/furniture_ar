// import 'package:babylonjs_viewer/babylonjs_viewer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:furniture_app/widgets/text_widget.dart';

// class ARView extends StatelessWidget {
//   String name;

//   ARView({required this.name});

//   @override
//   Widget build(BuildContext context) {
//     print('tate $name');
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: SvgPicture.asset("assets/icons/arrow-long-left.svg"),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: TextBold(text: name, fontSize: 18, color: Colors.black),
//         centerTitle: true,
//       ),
//       body: BabylonJSViewer(
//         src: ('assets/sofa/${name}.glb'),
//       ),
//     );
//   }
// }
