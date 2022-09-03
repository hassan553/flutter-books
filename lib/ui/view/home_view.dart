import 'package:flutter/material.dart';
import 'package:has/models/book_data.dart';
import 'package:has/ui/view/pdf_view.dart';
import 'book_details_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الدين الاسلامي',
          textDirection: TextDirection.rtl,
        ),
      ),
      body: ListView.builder(
        itemCount: BookData.bookItem.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PDFView(
                book: BookData.bookItem[index],
              );
            }));
          },
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          BookData.bookItem[index].title,
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          BookData.bookItem[index].author,
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .3,
                    height: MediaQuery.of(context).size.height * .2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          BookData.bookItem[index].imageUrl,
                        ),
                      ),
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
