import 'package:flutter/material.dart';
import 'package:to_do_app/view/signIn.dart';

void main() {
  runApp((MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    /*write the above code to make the status bar color same as appbar of the application
     if both are different */

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDo Application',
        home: SignIn());
  }
}
