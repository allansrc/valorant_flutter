import 'package:dio/dio.dart';
import '../feature/data/models/agents_response_model.dart';

class DioController {
  final dio = Dio();
  Future<List<Agent?>> getHttp() async {
    final response =
        await dio.get('https://valorant-api.com/v1/agents?language=pt-BR');
    final agentsResponse = AgentsResponse.fromJson(response.data);
    return agentsResponse.data!;
  }
}
