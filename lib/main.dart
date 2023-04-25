import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/providers/user_provider.dart';
import 'package:testing/responsive/mobile_screen_layout.dart';
import 'package:testing/responsive/responsive_layout_screen.dart';
import 'package:testing/responsive/web_screen_layout.dart';
import 'package:testing/screens/login_screen.dart';
// import 'package:testing/screens/signup_screen1.dart';
import 'package:testing/screens/scroll_signup.dart';
import 'package:testing/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyDgPF35eOqCeXmHoPVsevYgGdeWz6Ot-mg',
        appId: '1:606008067041:web:0860474a6806a79e7548a0',
        messagingSenderId: '606008067041',
        projectId: 'qurb-project',
        storageBucket: "qurb-project.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
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
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Qurb App',
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        // home: LoginScreen(),
        // home: SignupScreen(),

        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: primaryColor,
              ));
            }

            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
