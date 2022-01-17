//import 'dart:async';
// import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'mapsgoogle.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

//void main() => runApp(MyApp()); // htan etsi alla eprepe na kanw initialize opos katw
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: SplashScreenPage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class SplashScreenPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SplashScreen(
//       seconds: 5,
//       navigateAfterSeconds: new HomeScreen(),
//       backgroundColor: Colors.yellow,
//       title: new Text(
//         'Flutter Javatpoint',
//         textScaleFactor: 2,
//       ),
//       image: new Image.network(
//           'https://static.javatpoint.com/tutorial/flutter/images/flutter-creating-android-platform-specific-code3.png'),
//       loadingText: Text("Loading"),
//       photoSize: 150.0,
//       loaderColor: Colors.red,
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Splash Screen Example")),
//       body: Center(
//           child: Text("Welcome to Home Page",
//               style: TextStyle(color: Colors.black, fontSize: 30))),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Logo with Normal Text example
    Widget example5 = SplashScreenView(
      navigateRoute: HomePage(),
      duration: 5000,
      imageSize: 160,
      imageSrc: "splashscreen_image.png",
      text: "Christos Yelasis - Smart Bin",
      textType: TextType.NormalText,
      textStyle: TextStyle(
        fontSize: 45.0,
      ),
      backgroundColor: Colors.lightBlueAccent,
    );

    return MaterialApp(
      title: 'Splash screen Demo',
      home: example5,
    );
  }
}
//------------------------------------

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SplashScreen(),
//     );
//   }
// }
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     Timer(Duration(seconds: 5), () {
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>
//                 HomePage(), //kalei to function ths epomenhs pou theloume
//           ));
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Image.asset('splashscreen_image.png'),
//       ),
//     );
//   }
// }
//
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter GoogleMaps Demo',
//       theme: ThemeData(
//         primaryColor: Color(0xff6200ee),
//       ),
//       home: HomePage(),
//     );
//   }
// }
