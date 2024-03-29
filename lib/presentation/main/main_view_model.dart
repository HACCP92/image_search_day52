import 'package:flutter/material.dart';
import 'package:image_search_day52/data/repository/pixabay_photo_repository.dart';
import 'package:image_search_day52/presentation/main/main_state.dart';

class MainViewModel with ChangeNotifier {
  final GetTopFiveMostViewdImagesUseCase _getTopFiveMostViewdImagesUseCase;

  MainViewModel(this._getTopFiveMostViewdImagesUseCase);
  MainState _state = const MainState();

  MainState get state => _state;

  void fetchImages(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
        photos: await _getTopFiveMostViewdImagesUseCase.execute(query),
        isLoading: false);
    notifyListeners();
  }
}

class GetTopFiveMostViewdImagesUseCase {
  GetTopFiveMostViewdImagesUseCase(
      PixabayPhotoRepositoryImpl pixabayPhotoRepositoryImpl);

  execute(String query) {}
}
