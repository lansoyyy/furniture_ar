import 'package:flutter/material.dart';

import '../../widgets/drawer_widget.dart';
import '../../widgets/text_widget.dart';

class ContactusPage extends StatelessWidget {
  const ContactusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/googlelogo.png',
                  height: 25,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 20,
                ),
                TextRegular(
                    text: 'angelicasabularse01@gmail.com ',
                    fontSize: 16,
                    color: Colors.grey),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/fblogo.png',
                  height: 25,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 20,
                ),
                TextRegular(
                    text: 'facebook.com/angelica.c.sabularse',
                    fontSize: 16,
                    color: Colors.grey),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.local_phone_outlined,
                  color: Colors.grey,
                  size: 28,
                ),
                const SizedBox(
                  width: 20,
                ),
                TextRegular(
                    text: '+639760419218', fontSize: 16, color: Colors.grey),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.pin_drop_outlined,
                  color: Colors.grey,
                  size: 28,
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 200,
                  child: TextRegular(
                      text: 'San Antonio, Sto. Tomas City, Batangas',
                      fontSize: 16,
                      color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
