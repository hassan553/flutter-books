import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:has/ui/view/pdf_view.dart';
import '../../models/book.dart';

class BookDetailsView extends StatelessWidget {
  Book? book;
  BookDetailsView({
    Key? key,
    this.book,
  }) : super(key: key);

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
        title: Text(book!.title.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        book!.imageUrl,
                      ),
                    ),
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Author : ${book!.author.toString()}'),
                        const SizedBox(
                          height: 5,
                        ),
                        Text('Book description '),
                        const SizedBox(
                          height: 5,
                        ),
                       
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 7, 6, 56),
                      minimumSize: const Size(
                        double.infinity,
                        45,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Download ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return PDFView(
                          book: book,
                        );
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 7, 6, 56),
                      minimumSize: const Size(
                        double.infinity,
                        45,
                      ),
                    ),
                    child: const Text(
                      'Read',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
