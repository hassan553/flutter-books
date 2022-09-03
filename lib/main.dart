import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:has/ui/view/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color color = const Color.fromARGB(255, 7, 6, 56);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Books',
        theme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: color, unselectedItemColor: Colors.grey),
          textTheme: TextTheme(
            titleLarge:
                TextStyle(color: color, overflow: TextOverflow.ellipsis),
            titleMedium: const TextStyle(
              color: Color.fromARGB(255, 88, 85, 85),
            ),
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: color,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
