import 'package:flutter/material.dart';
import 'package:iqra_app/components/listen1_item.dart';
import 'package:iqra_app/models/item_model.dart';

// ignore: camel_case_types
class Listen1 extends StatelessWidget {
  final String name;
  final List list_audio;
  final String Photo;
  const Listen1({super.key, required this.name, required this.list_audio, required this.Photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
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
                  title: Text(
                    name,
                    style: const TextStyle(
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
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Listen1Item(
                      item: items[index],
                      surah_id: index + 1,
                      index: index,
                      ListAudio: list_audio,
                      photo: Photo,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
