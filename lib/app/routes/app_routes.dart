// imports de framework e pacotes externos
import 'package:flutter/widgets.dart';

// imports das pages
import 'package:valorant_flutter/app/modules/home/view/home_page.dart';
import 'package:valorant_flutter/app/modules/maps/view/maps_page.dart';

class AppRoutes {
  /// classe AppRoutes armazena dados de rotas. incluindo:
  /// rotas nomeadas :: exemplo > '/agents'
  /// BuildWidget :: exemplo > (BuildContext context) => PaginaQueVamosNavegar()
  ///
  /// Daí vc pode perguntar... Pra que serve rotas nomeadas?
  /// rotas nomeadas servem para facilitar a navegação entre as telas.
  /// por exemplo, invés de usarmos ;
  /// ```Navigator.push(
  ///       context,
  ///       MaterialPageRoute<void>(
  ///          builder: (BuildContext context) => const HomePage(),
  ///       ),
  ///   );```
  ///
  /// podemos simplesmente usar :
  ///  `Navigator.push(context, /home);`
  ///
  /// Para mais detalhes checar a documentação: https://docs.flutter.dev/cookbook/navigation/named-routes

  final routeList = <String, Widget Function(BuildContext)>{
    /// a rota nomeada '/' é o entrypoint do app. ou seja, a tela ou rota inicial
    '/': (BuildContext context) => const HomePage(),

    /// podemos também definir a rota /home
    '/home': (BuildContext context) => const HomePage(),

    /// demais rotas
    '/maps': (BuildContext context) => const MapsPage()
  };
}
