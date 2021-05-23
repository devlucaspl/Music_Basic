import 'package:basic_music/app/modules/player/player_page.dart';
import 'package:basic_music/app/modules/player/player_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PlayerModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PlayerStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => PlayerPage()),
  ];
}
