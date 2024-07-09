import 'package:flutter/material.dart';
import 'package:iqra_app/screens/homepage.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/onboarding2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "يحتوى التطبيق على العديد من الاصوات \n والتلاوات المختلفه لأفضل المشايخ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: "Amiri",
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: Color(0xff2400FF),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.white,
                    )
                  ],
                ),
                Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, top: 10, bottom: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xff2400FF),
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Color(0xff2400FF)),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 5),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return HomePage(0);
                          }));
                        },
                        child: const Text('ابدأ الأن',
                            style:
                                TextStyle(fontSize: 22, fontFamily: "Amiri")),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
