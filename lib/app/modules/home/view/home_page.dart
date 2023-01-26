import 'package:flutter/material.dart';
import 'package:valorant_flutter/app/modules/home/controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: controller.counter,
        builder: (context, value, Widget? child) {
          return GridView.count(
              padding: const EdgeInsets.all(8),
              crossAxisCount: 2,
              children: [
                Card(
                  color: Colors.blue,
                  child: FloatingActionButton(
                    elevation: 0,
                    child: const Text('Maps'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/maps');
                    },
                  ),
                ),
                Card(
                  color: Colors.blue,
                  child: FloatingActionButton(
                    elevation: 0,
                    child: const Text('Agents'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/agents');
                    },
                  ),
                ),
              ]);
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: controller.incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
