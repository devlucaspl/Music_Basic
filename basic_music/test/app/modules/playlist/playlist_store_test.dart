import 'package:flutter_test/flutter_test.dart';
import 'package:basic_music/app/modules/playlist/playlist_store.dart';
 
void main() {
  late PlaylistStore store;

  setUpAll(() {
    store = PlaylistStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}