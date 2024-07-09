import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:iqra_app/models/item_model.dart';

class PDFViewPage extends StatefulWidget {
  final String path;
  final int index;

  const PDFViewPage({super.key, required this.path, required this.index});

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _PDFViewPageState createState() => _PDFViewPageState(Index: index);
}

class _PDFViewPageState extends State<PDFViewPage> {
  final int Index;
  _PDFViewPageState({required this.Index});
  bool _isReady = false;

  @override
  Widget build(BuildContext context) {
    final Item item = items[Index];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2400FF),
        title: Text(
          item.surah_name,
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
            icon:const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            enableSwipe: true,
            autoSpacing: false,
            pageFling: true,
            onRender: (pages) {
              setState(() {
                _isReady = true;
              });
            },
            onError: (error) {
              setState(() {});
            },
            onPageError: (page, error) {
              setState(() {});
            },
            onViewCreated: (PDFViewController pdfViewController) {
            },
            onPageChanged: (int? page, int? total) {
              setState(() {
              });
            },
          ),
          !_isReady
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const Offstage()
        ],
      ),
    );
  }
}
