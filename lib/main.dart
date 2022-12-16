import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev_test/data/preferences/prefs_user.dart';
import 'package:odev_test/logic/bloc/db_get_bloc.dart';
import 'package:odev_test/logic/cubit/db_crud_cubit.dart';
import 'package:odev_test/logic/cubit/user_change_cubit.dart';

import 'package:odev_test/presentation/screens/home_screen.dart';
import 'package:odev_test/presentation/screens/publish_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsUser.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserChangeCubit>(create: (context) => UserChangeCubit()),
        BlocProvider<DbCrudCubit>(create: (context) => DbCrudCubit()),
        // BlocProvider<DbGetBloc>(create: (context) => DbGetBloc()),
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
