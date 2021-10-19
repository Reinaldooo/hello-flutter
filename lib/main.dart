import 'package:flutter/material.dart';
//
import 'package:helloworld/pages/home_page.dart';
import 'package:helloworld/pages/image_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        ImageDetail.routeName: (context) => const ImageDetail(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Olá Flutter'),
      // home: const ImageDetail(),
      debugShowCheckedModeBanner: false,
    );
  }
}
