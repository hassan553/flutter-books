import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../models/book.dart';

class PDFView extends StatelessWidget {
  Book? book;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  PDFView({Key? key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrowLeftCircle),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(book!.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(1),
        child: SfPdfViewer.asset(
          book!.path,
          key: _pdfViewerKey,
        ),
      ),
    );
  }
}
