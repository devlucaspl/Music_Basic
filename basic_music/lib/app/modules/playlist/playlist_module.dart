import 'package:basic_music/app/modules/playlist/playlist_page.dart';
import 'package:basic_music/app/modules/playlist/playlist_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PlaylistModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PlaylistStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => PlaylistPage()),
  ];
}
