import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('Valyutalar kursi'),
              accountEmail: Text('umrzakovazarnigor14@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://media.istockphoto.com/id/1423704067/vector/currency-conversion-line-icon-dollar-conversion-outline-vector-illustration.jpg?s=612x612&w=0&k=20&c=yZLX7wFfXSNGsB9GtGkumdy9SJzZlE4UxP3UblOz0uw=',
                ),
              )),
          drawerElement('Play Marketda baholang',
            Icon(Icons.play_circle_outlined, color: Colors.orange[900]), () {
              Uri.https('https://play.google.com/store/apps?hl=ru&gl=US&pli=1');
            },),
          drawerElement('Dastur kodlari',
              Icon(Icons.key, color: Colors.yellow[600]), () {
                launchUrl(Uri.parse('https: '));
              }),
          drawerElement('Telegram kanalimiz',
            Icon(Icons.telegram_outlined, color: Colors.blue[600]), () {},),
          drawerElement('Biz Facebookda',
            Icon(Icons.facebook, color: Colors.blue[900]), () {
              launchUrl(Uri.parse('https:facebook.com'))
            },),
          drawerElement('Biz Twitterda',
              Icon(Icons.arrow_back_ios_rounded,
                  color: Colors.blue[800]), () {}),
          drawerElement('Biz Instagramda',
              Icon(Icons.camera_alt_outlined, color: Colors.pink[600]), () {}),
          drawerElement('Fikr mulohaza',
              Icon(Icons.message, color: Colors.green[700]), () {}),
          drawerElement('Dastur haqida',
              Icon(Icons.mark_chat_read_outlined, color: Colors.red), () {}),
        ],
      ),
    );
  }

  Widget drawerElement(String title, Widget icon, Function() onPressed) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      leading: icon,
    );
  }
}
