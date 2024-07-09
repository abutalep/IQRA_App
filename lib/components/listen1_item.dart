import 'package:flutter/material.dart';
import 'package:iqra_app/models/item_model.dart';
import 'package:iqra_app/screens/play.dart';

class Listen1Item extends StatelessWidget {
  final Item item;
  final int surah_id;
  final int index;
  final String photo;
  final List ListAudio;

  const Listen1Item({
    required this.surah_id,
    required this.item,
    super.key,
    required this.index,
    required this.photo,
    required this.ListAudio,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xffBBC4CE),
              width: 1,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xff2400FF),
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: Color(0xff2400FF),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                ),
                onPressed: () {
                  int Index = index;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Play(
                      index: Index,
                      Photo: photo,
                      listAudio: ListAudio,
                    );
                  }));
                },
                child: const Icon(
                  Icons.arrow_right_outlined,
                  size: 44,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      item.surah_name,
                      style: const TextStyle(
                        fontFamily: "Amiri",
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      item.surah_description,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Color(0xffBBC4CE),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background/muslim (1) 1.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 50,
                width: 50,
                child: Center(
                    child: Text(
                  "$surah_id",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
