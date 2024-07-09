import 'package:flutter/material.dart';
import 'package:iqra_app/categories/audio_provider.dart';
import 'package:provider/provider.dart';
import 'package:iqra_app/models/item_model.dart';

class Play extends StatelessWidget {
  final int index;
  final String Photo;
  final List listAudio;

  const Play({
    super.key,
    required this.index,
    required this.Photo,
    required this.listAudio,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    var audioProvider = Provider.of<AudioProvider>(context);
    final Item item = items[index];
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background/home.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xff2400FF), width: 2),
                    ),
                  ),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    title: const Text(
                      "المشغل الان",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Amiri",
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    centerTitle: true,
                    leading: Container(), // Removes the default back button
                    actions: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(1000),
                                bottomRight: Radius.circular(1000)),
                            image: DecorationImage(
                              image: AssetImage(Photo),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: screenHeight * 0.55,
                          width: screenWidth,
                          child: null,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            item.surah_name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "Amiri",
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${audioProvider.position.inHours.remainder(60).toString().padLeft(2, '0')}:${audioProvider.position.inMinutes.remainder(60).toString().padLeft(2, '0')}:${audioProvider.position.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
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
                                Text(
                                  "${audioProvider.musicLength.inHours.remainder(60).toString().padLeft(2, '0')}:${audioProvider.musicLength.inMinutes.remainder(60).toString().padLeft(2, '0')}:${audioProvider.musicLength.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 36.0),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            audioProvider.stop();
                                            // Increment the index and ensure it wraps around if it exceeds the list length
                                            int newIndex =
                                                (index - 1) % listAudio.length;

                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Play(
                                                  index: newIndex,
                                                  Photo: Photo,
                                                  listAudio: listAudio,
                                                ),
                                              ),
                                            );
                                          },
                                          icon: const Icon(Icons.skip_previous),
                                          iconSize: 35,
                                          color: Colors.white,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: IconButton(
                                            onPressed: () {
                                              audioProvider
                                                  .play(listAudio[index]);
                                            },
                                            icon: Icon(audioProvider.playBtn),
                                            iconSize: 70,
                                            color: Colors.white,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            audioProvider.stop();
                                            // Increment the index and ensure it wraps around if it exceeds the list length
                                            int newIndex =
                                                (index + 1) % listAudio.length;

                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Play(
                                                  index: newIndex,
                                                  Photo: Photo,
                                                  listAudio: listAudio,
                                                ),
                                              ),
                                            );
                                          },
                                          icon: const Icon(Icons.skip_next),
                                          iconSize: 35,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
