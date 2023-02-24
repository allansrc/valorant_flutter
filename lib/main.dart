import 'package:flutter/material.dart';
import 'package:valorant_flutter/app/routes/app_routes.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 0, 0),
            secondary: const Color.fromARGB(255, 255, 255, 255)),
      ),
      initialRoute: '/',
      routes: AppRoutes().routeList,
    );
  }
}
