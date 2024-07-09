import 'package:flutter/material.dart';
import 'package:iqra_app/categories/audio_provider.dart';
import 'package:iqra_app/models/item_model.dart';
import 'package:iqra_app/models/listen_model.dart';
import 'package:iqra_app/screens/listen.dart';
import 'package:iqra_app/screens/read.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  int index;
  HomePage(
    this.index, {
    super.key,
  });
  final List listAudio = listen_items[1].list_audio;

  @override
  Widget build(BuildContext context) {
    var audioProvider = Provider.of<AudioProvider>(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/home.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "إقرأ",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                      image: AssetImage(
                          'assets/background/play.png'), // Background image
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 22),
                            child: Text(
                              items[index].surah_name,
                              style: const TextStyle(
                                  fontFamily: "Amiri",
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Flexible(
                            child: Slider.adaptive(
                              activeColor: Colors.blue[800],
                              inactiveColor: Colors.grey[350],
                              value: audioProvider.position.inSeconds
                                  .toDouble()
                                  .clamp(
                                      0.0,
                                      audioProvider.musicLength.inSeconds
                                          .toDouble()),
                              max: audioProvider.musicLength.inSeconds
                                  .toDouble(),
                              onChanged: (value) {
                                audioProvider.seekToSec(value.toInt());
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    audioProvider.stop();
                                    int newIndex =
                                        (index - 1) % listAudio.length;

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HomePage(newIndex),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.skip_previous),
                                  iconSize: 35,
                                  color: Colors.white,
                                ),
                                IconButton(
                                  onPressed: () {
                                    audioProvider.play(listAudio[index]);
                                  },
                                  icon: Icon(audioProvider.playBtn),
                                  iconSize: 70,
                                  color: Colors.white,
                                ),
                                IconButton(
                                  onPressed: () {
                                    audioProvider.stop();
                                    int newIndex =
                                        (index + 1) % listAudio.length;

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage(
                                          newIndex,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.skip_next),
                                  iconSize: 35,
                                  color: Colors.white,
                                ),
                                IconButton(
                                  onPressed: () {
                                    audioProvider.toggleRepeat();
                                  },
                                  icon: Icon(
                                    audioProvider.isRepeating
                                        ? Icons.repeat_one
                                        : Icons.repeat,
                                  ),
                                  iconSize: 35,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/background/read.png'), // Path to your image
                      fit: BoxFit
                          .cover, // Adjusts the image to cover the entire container
                    ),
                  ),
                  height: 200,
                  width: double.infinity,
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color(0xff0B2062),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: const CircleBorder(
                            side: BorderSide(color: Color(0xff0B2062)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const Read();
                          }));
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/background/listening.png'), // Path to your image
                      fit: BoxFit
                          .cover, // Adjusts the image to cover the entire container
                    ),
                  ),
                  height: 200,
                  width: double.infinity,
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color(0xff0B2062),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: const CircleBorder(
                            side: BorderSide(color: Color(0xff0B2062)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const Listen();
                          }));
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
