import 'package:flutter/material.dart';
import 'package:odev_test/databases/mockup_data.dart';
import 'package:odev_test/preferences/prefs_user.dart';
import 'package:odev_test/provider/provider_homepage.dart';
import 'package:odev_test/screens/home_screen.dart';
import 'package:odev_test/screens/publish_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsUser.init();
  await putData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RefreshHome(),
        )
      ],
      child: MaterialApp(
        title: 'Test ODEV.TECH',
        debugShowCheckedModeBanner: false,
        initialRoute: "home",
        routes: {
          "home": (context) => const HomeScreen(),
          "publish": (context) => const PublishScreen(),
        },
        theme: ThemeData(primarySwatch: Colors.purple),
      ),
    );
  }
}
