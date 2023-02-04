import 'package:flutter/material.dart';
import 'package:valorant_flutter/app/modules/agents/controller/dio_agents_controller.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../feature/data/models/agents_response_model.dart';

class AgentsPage extends StatelessWidget {
  AgentsPage({super.key});
  final controller = DioController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Agents')),
        backgroundColor: Colors.black54,
      ),
      body: FutureBuilder<List<Agent?>>(
          future: controller.getHttp(),
          builder: (context, apidata) {
            if (apidata.data == null) {
              return const Text('erro');
            }
            final agentslist = apidata.data!;
            return ListView.builder(
              itemCount: agentslist.length,
              itemBuilder: (context, index) {
                final agent = agentslist[index];
                final abilities = agent?.abilities;
                if (agent == null) {
                  return Container();
                }
                return Container(
                  padding: const EdgeInsets.all(6),
                  color: Colors.black,
                  child: Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          '${agent.displayName}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white60,
                          ),
                        ),
                        subtitle: Text(
                          '${agent.description}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        trailing: FloatingActionButton(
                          heroTag: agent.uuid,
                          hoverColor: Colors.black,
                          backgroundColor: Colors.black54,
                          child: const Icon(
                            Icons.open_in_full,
                            color: Colors.white70,
                          ),
                          onPressed: () {
                            showBarModalBottomSheet(
                                backgroundColor: Colors.black,
                                context: context,
                                builder: (context) {
                                  return GridView.count(
                                    padding: const EdgeInsets.all(10),
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    crossAxisCount: 2,
                                    children: [
                                      ...List.generate(
                                        abilities!.length,
                                        (abilityindex) => Container(
                                          child: Text(
                                            '${abilities[abilityindex]?.description}',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          },
                        ),
                        leading: Image.network('${agent.displayIconSmall}'),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
