import 'package:flutter/material.dart';
import 'package:iqra_app/models/listen_model.dart';
import 'package:iqra_app/screens/listen1.dart';

class ListenItem extends StatelessWidget {
  final ListenModel listen_item;

  const ListenItem({required this.listen_item, super.key});
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xff2400FF),
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xff2400FF)),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Listen1(name: listen_item.name ,
                    list_audio: listen_item.list_audio,
                    Photo: listen_item.photo,
                    );
                  }));
                },
                child: const Text(
                  'استماع',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  listen_item.name,
                  style: const TextStyle(
                    fontFamily: "Amiri",
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    listen_item.number_audio,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: "Poppins"),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(listen_item.photo),
                fit: BoxFit.cover,
              ),
            ),
            height: 80,
            width: 94,
            child: null,
          ),
        ],
      ),
    );
  }
}
