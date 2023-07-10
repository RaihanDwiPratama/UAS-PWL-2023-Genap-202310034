import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:nature_history/pages/detail/styles.dart';
import 'package:nature_history/utils/colors.dart';

class ContainerKelopak extends StatefulWidget {
  const ContainerKelopak({super.key});

  @override
  State<ContainerKelopak> createState() => _ContainerKelopakState();
}

class _ContainerKelopakState extends State<ContainerKelopak> {
  final FlutterTts flutterTts = FlutterTts();
  List<dynamic> languages = [];
  String selectedLanguage = '';

  @override
  void initState() {
    super.initState();
    initializeTts();
  }

  Future<void> initializeTts() async {
    await flutterTts.setLanguage("en-US");
    languages = await flutterTts.getLanguages;
    setState(() {
      selectedLanguage = languages.first;
    });
  }

  void speak(String text) async {
    await flutterTts.setLanguage(selectedLanguage);
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  void _displayModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
              top: 250,
              left: 825,
              child: Container(
                width: 212,
                decoration: Styles.textModal,
                padding: EdgeInsets.all(18),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/images/kelopak.png",
                            fit: BoxFit.cover,
                            height: 120,
                            width: double.infinity,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: Styles.buttonClose,
                              child: Icon(
                                Icons.close,
                                color: AppColors.quaternery,
                                size: 10,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 14),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 90,
                          child: RichText(
                            text: TextSpan(
                              text: 'Flower Petals ',
                              style: Styles.textSubPrimary,
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      'each flower generally has six petals that are shaped.',
                                  style: Styles.textSubSecondary,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            DropdownButtonHideUnderline(
                              child: Container(
                                decoration: Styles.buttonDropdown,
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Material(
                                  child: DropdownButton<String>(
                                    icon: Transform.rotate(
                                        angle: 270 * 3.14 / 180,
                                        child: Icon(
                                          Icons.chevron_left,
                                          color: AppColors.primary,
                                          size: 15,
                                        )),
                                    isDense: true,
                                    style: Styles.textDropdown,
                                    value: selectedLanguage,
                                    items: languages.map((language) {
                                      return DropdownMenuItem<String>(
                                        value: language,
                                        child: Text(language),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedLanguage = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                String text =
                                    'These are flower petals. The flower petals on the Peruvian Lily come in a variety of bright colors and beautiful patterns. Each flower generally has six petals that are shaped like thin, pointed leaves.';
                                speak(text);
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                margin: EdgeInsets.only(top: 15),
                                decoration: Styles.buttonVolume,
                                child: Icon(
                                  Icons.volume_up,
                                  color: AppColors.quaternery,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: Styles.button,
      child: GestureDetector(
        onTap: () {
          _displayModal(context);
        },
      ),
    );
  }
}
