import 'package:firebase/provider/provider1.dart';
import 'package:firebase/firstpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Fireprovider(),
        )
      ],
      child: MaterialApp(
        home: MyfireBaseDemo(from: 'new',id: "",heading: "Edit accound"),
      ),
    );
  }
}
