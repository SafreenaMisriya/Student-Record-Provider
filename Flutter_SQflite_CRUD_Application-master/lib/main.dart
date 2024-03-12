import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_10/database/db_functions.dart';
import 'package:sqflite_10/provider/Provider_edit.dart';
import 'package:sqflite_10/provider/provider_addstudent.dart';
import 'package:sqflite_10/provider/provider_datacontroller.dart';
import 'package:sqflite_10/screen/splash.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>AddProvider()),
        ChangeNotifierProvider(create: (context)=>EditProvider()),
        ChangeNotifierProvider(create: (context)=>StudentdataProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.pink,
        ),
        debugShowCheckedModeBanner: false,
        home:const SplashScreen(),
      ),
    );
  }
}
