import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_list/features.auth/presentation/pages/initial_screen.dart';
import 'package:pokemon_list/injection.dart';

import 'config/theme/app_themes.dart';
import 'features.auth/presentation/widgets/pokemon_item.dart';

void main() async {
  await GetIt.I.allReady();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: HomeInitialScreen(bloc: sl()),
    );
  }
}
