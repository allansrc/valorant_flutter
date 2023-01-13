import 'package:flutter/material.dart';
import 'package:valorant_flutter/app/modules/agents/view/agents_page.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AgentsPage(),
    );
  }
}
