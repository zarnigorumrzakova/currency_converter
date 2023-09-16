import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF00D0CE), Color(0xFF82E5BA)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  'assets/images/currency.png',
                  width: 80,
                  height: 80,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  '${translate?.currencyConverter}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                drawerElement(FlutterRemix.google_play_line,
                    '${translate?.rateOnPlayMarket}', () {
                  launchUrl(Uri.parse(
                      'https://play.google.com/store/apps/details?id=uz.mobile.currencymvvm'));
                }),
                drawerElement(
                    FlutterRemix.github_line, '${translate?.sourceCode}', () {
                  launchUrl(Uri.parse(
                      'https://github.com/zarnigorumrzakova/currency_converter'));
                }),
                drawerElement(FlutterRemix.telegram_line,
                    '${translate?.ourTelegramChannel}', () {
                  launchUrl(Uri.parse('https://t.me/flutterblogs'));
                }),
                drawerElement(
                    FlutterRemix.facebook_line, '${translate?.weAreOnFacebook}',
                    () {
                  launchUrl(Uri.parse('https://facebook.com'));
                }),
                drawerElement(
                    FlutterRemix.twitter_line, '${translate?.weAreOnTwitter}',
                    () {
                  launchUrl(Uri.parse('https://twitter.com'));
                }),
                drawerElement(FlutterRemix.instagram_line,
                    '${translate?.weAreOnInstagram}', () {
                  launchUrl(Uri.parse('https://instagram.com/_umrzakova_14'));
                }),
                drawerElement(
                    FlutterRemix.chat_1_line, '${translate?.feedback}', () {
                  launchUrl(Uri.parse(
                      'https://github.com/zarnigorumrzakova/currency_converter'));
                }),
                drawerElement(
                    FlutterRemix.information_line, '${translate?.about}', () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xFF00D0CE), Color(0xFF82E5BA)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${translate?.currencyExchange}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'v1.0.0',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text:
                                      '${translate?.centralBankOfTheRepublicOfUzbekistan}',
                                  style: const TextStyle(
                                    color: Color(0xFF007C70),
                                    fontSize: 16,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      launchUrl(Uri.parse('https://cbu.uz'));
                                    },
                                  children: [
                                    TextSpan(
                                      text:
                                          '${translate?.preparedOnTheBasisOfOpenDataOpenSourceProgram}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Apache License',
                                      style: const TextStyle(
                                        color: Color(0xFF007C70),
                                        fontSize: 16,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          launchUrl(Uri.parse(
                                              'https://www.apache.org'));
                                        },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                ' ${translate?.zarnigorUmrzakova}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: const Color(0xFF81D6C3),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'OK',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                '©Zarnigor',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            // drawerElement('Play Marketda baholang',
            //   Icon(Icons.play_circle_outlined, color: Colors.orange[900]), () {
            //   launchUrl(Uri.parse('https://github.com/zarnigorumrzakova/currency_converter'));
            //   },),
            // drawerElement('Dastur kodlari',
            //     Icon(Icons.key, color: Colors.yellow[600]), () {
            //       launchUrl(Uri.parse('https://github.com/zarnigorumrzakova/currency_converter'));
            //     }),
            // drawerElement('Telegram kanalimiz',
            //   Icon(Icons.telegram_outlined, color: Colors.blue[600]), () {
            //   launchUrl(Uri.parse('https://telegram.com'));
            //   },),
            // drawerElement('Biz Facebookda',
            //   Icon(Icons.facebook, color: Colors.blue[900]), () {
            //     launchUrl(Uri.parse('https://facebook.com'));
            //   },),
            // drawerElement('Biz Twitterda',
            //     Icon(Icons.arrow_back_ios_rounded,
            //         color: Colors.blue[800]), () {
            //   launchUrl(Uri.parse('https://twitter.com'));
            //     }),
            // drawerElement('Biz Instagramda',
            //     Icon(Icons.camera_alt_outlined, color: Colors.pink[600]), () {
            //   launchUrl(Uri.parse('https://instagram.com'));
            //     }),
            // drawerElement('Fikr mulohaza',
            //     Icon(Icons.message, color: Colors.green[700]), () {
            //   launchUrl(Uri.parse('https://github.com/zarnigorumrzakova/currency_converter'));
            //     }),
            // drawerElement('Dastur haqida',
            //     Icon(Icons.mark_chat_read_outlined, color: Colors.red), () {
            //   launchUrl(Uri.parse('https://github.com/zarnigorumrzakova/currency_converter'));
            //     }),
          ],
        ),
      ),
    );
  }

  Widget drawerElement(IconData iconData, String title, Function() onPressed) {
    return ListTile(
      onTap: onPressed,
      leading: Icon(
        iconData,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black),
      ),
    );
  }
}
