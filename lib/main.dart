import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task2/Thems&colors/Theme.dart';

import 'Screens/HomePage.dart';
import 'Screens/detealis_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home:HomePage(),
    );
  }
}
