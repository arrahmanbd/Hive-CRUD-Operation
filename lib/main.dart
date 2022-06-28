import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hivedb/home.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  //Initisilize hive 
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  //Working with hive needs to open box, hive is like boxes with key value.
  //It's work like firebase collection
  await Hive.openBox('DemoBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
