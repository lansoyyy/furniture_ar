import 'package:flutter/material.dart';

import '../../widgets/drawer_widget.dart';
import '../../widgets/text_widget.dart';

class AboutusPage extends StatefulWidget {
  const AboutusPage({Key? key}) : super(key: key);

  @override
  State<AboutusPage> createState() => _AboutusPageState();
}

class _AboutusPageState extends State<AboutusPage> {
  String aboutUsContent = '''
Welcome to Fixture, your ultimate destination for transforming your living space with augmented reality furniture solutions.

At Fixture, we understand the importance of creating a home that reflects your unique style and personality. Our innovative AR technology allows you to visualize how different furniture pieces will look and fit in your space before making any commitments. Say goodbye to guesswork and hello to confidence in your design decisions.

Our mission is to make furniture shopping an enjoyable and hassle-free experience. Whether you're furnishing a new home, redesigning a room, or simply looking for inspiration, Fixture is here to help every step of the way.

Why choose Fixture?

1. Seamless AR Experience: Our cutting-edge AR technology provides realistic 3D models of furniture items, allowing you to virtually place them in your room and see how they complement your existing decor.

2. Extensive Catalog: Explore thousands of high-quality furniture items from top brands and designers. From sofas and tables to lighting and accessories, we have everything you need to create your dream space.

3. Personalized Recommendations: Receive tailored recommendations based on your style preferences, budget, and room dimensions. Our goal is to help you find the perfect pieces that meet your needs and exceed your expectations.

4. Convenient Shopping: Shop directly from the app with just a few taps. Enjoy hassle-free delivery and easy returns, so you can focus on designing your space without any worries.

5. Expert Support: Our team of design experts is here to assist you with any questions or concerns you may have. Whether you need advice on furniture placement or tips for mixing and matching styles, we're always ready to help.

Join the thousands of satisfied customers who have transformed their homes with Fixture. Download our app today and start designing the home of your dreams with confidence.
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextBold(
                  text: 'About FixTure', fontSize: 24, color: Colors.black),
              const SizedBox(
                height: 10,
              ),
              TextRegular(
                  text: aboutUsContent, fontSize: 14, color: Colors.grey),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
