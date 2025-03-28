import 'package:flutter/material.dart';
import 'package:pokemon_app_001/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'screens/login_screen.dart';
import 'services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider<ApiService>(create: (_) => ApiService())],
      child: MaterialApp(
        title: 'Pokémon App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LoginScreen(),
        routes: {'/home': (context) => HomeScreen()},
      ),
    );
  }
}
