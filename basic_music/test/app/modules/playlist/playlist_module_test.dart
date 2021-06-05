import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:basic_music/app/modules/playlist/playlist_module.dart';
 
void main() {

  setUpAll(() {
    initModule(PlaylistModule());
  });
}