import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

import 'tabs_screen.dart';
import 'Screen/login.dart';
import 'Screen/profile.dart';
import 'widgets/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'PLACEMENTOR',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Container(
                width: double.maxFinite,
                height: 400,
                child: SpinKitThreeInOut(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven
                            ? Color.fromARGB(255, 43, 41, 43)
                            : Color.fromARGB(255, 43, 41, 43),
                      ),
                    );
                  },
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                  'SOMETHING WENT WRONG :( \n PLEASE CHECK CONNECTION AND COME BACK AGIAN !!'),
            );
          } else if (snapshot.hasData) {
            return MyHomePage();
          } else {
            return MyLogin();
          }
        },
      ),
      routes: {MyProfile.routeName: (context) => MyProfile()},
    );
  }
}
