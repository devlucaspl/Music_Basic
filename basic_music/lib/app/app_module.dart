import 'package:basic_music/app/modules/player/player_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/playlist/playlist_module.dart';


class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/home', module: PlaylistModule()),
    ModuleRoute('/player', module: PlayerModule())
  ];

}