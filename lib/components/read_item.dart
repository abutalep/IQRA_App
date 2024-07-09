import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iqra_app/models/item_model.dart';
import 'package:iqra_app/screens/surah.dart';
import 'package:path_provider/path_provider.dart';

class ReadItem extends StatelessWidget {
  final Item item;
  final int surah_id;

  const ReadItem({required this.surah_id, required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> openPDF(BuildContext context) async {
      // Load PDF from assets
      final byteData = await rootBundle.load(item.surah_path);
      final file = File('${(await getTemporaryDirectory()).path}/001.pdf');
      await file.writeAsBytes(byteData.buffer.asUint8List());

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PDFViewPage(path: file.path, index: (surah_id-1),),
        ),
      );
    }

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
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xff2400FF)),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                ),
                onPressed: () => openPDF(context),
                child: const Text(
                  'قراءة',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Amiri",
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
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
                      style:const TextStyle(
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
