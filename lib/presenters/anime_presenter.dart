import 'package:modul_3/models/anime_model.dart';
import 'package:modul_3/network/base_network.dart';

abstract class AnimeView {
  void showLoading();
  void hideLoading();
  void showAnimeList(List<Anime> animeList);
  void showError(String message);
}

class AnimePresenter {
  final AnimeView view;
  AnimePresenter(this.view);
  Future<void> loadAnimedata(String endpoint) async {
    try {
      final List<dynamic> data = await BaseNetwork.getData(endpoint);
      final animeList = data.map((json) => Anime.fromJson(json)).toList();
      view.showAnimeList(animeList);
    } catch (e) {
      view.showError(e.toString());
    } finally {
      view.hideLoading();
    }
  }
}
