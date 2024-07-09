import 'package:flutter/material.dart';
import 'package:iqra_app/components/listen_item.dart';
import 'package:iqra_app/models/listen_model.dart';

class Listen extends StatelessWidget {
  const Listen({super.key});

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
                  title: const Text(
                    "إستماع",
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
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: listen_items.length,
                  itemBuilder: (context, index) {
                    return ListenItem(
                      listen_item: listen_items[index],
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
