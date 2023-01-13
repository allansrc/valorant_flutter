import 'package:flutter/material.dart';
import 'package:valorant_flutter/app/modules/agents/controller/dio_agents_controller.dart';

import '../feature/data/models/agents_response_model.dart';

class AgentsPage extends StatelessWidget {
  AgentsPage({super.key});
  final controller = DioController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agents')),
      body: FutureBuilder<List<Agent?>>(
          future: controller.getHttp(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Text('erro');
            }
            final newslist = snapshot.data!;
            return ListView.builder(
              itemCount: newslist.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                if (item == null) {
                  return Container();
                }
                // final agentsResponse = AgentsResponse();
                // agentsResponse.data?[index].displayName;
                return Text('${item.displayName}');
              },
            );
          }),
    );
  }
}
