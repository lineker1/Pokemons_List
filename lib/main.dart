import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_list/features.auth/presentation/pages/info_pokemon_screen.dart';
import 'package:pokemon_list/features.auth/presentation/pages/initial_screen.dart';
import 'package:pokemon_list/injection.dart';

import 'config/theme/app_themes.dart';

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
      initialRoute: '/initial',
      routes: {
        '/initial': (context) => HomeInitialScreen(bloc: sl()),
        '/info_screen': (context) => const InfoPokemonScreen(),
      },
    );
  }
}
