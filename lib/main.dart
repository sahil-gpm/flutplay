import 'package:flutplay/activities/song_details.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutplay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0XFF251117),secondary: const Color(0XFF1BB751)),
          primaryColor: const Color(0XFF251117),
          useMaterial3: true,

          // textTheme:
          textTheme: const TextTheme(
              bodySmall: TextStyle(fontSize: 15, color: Color(0XFF1BB751)),
              bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500 ,color: Colors.white),
              displaySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500 ,color: Colors.white),
              displayLarge: TextStyle(fontSize: 30,letterSpacing: -1,color: Colors.white)),
              ),

      home: const SongDetails(),
    );
  }
}
