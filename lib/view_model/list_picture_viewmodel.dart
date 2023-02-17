import 'package:flutter_mvvm_demo/model/picsum_model.dart';
import 'package:flutter_mvvm_demo/services/service.dart';

class ListPictureViewModel {
  List<PictureViewModel>? pictures;

  Future<void> fetchPictures() async {
    final apiResult = await Service().fetchPictureAPI();
    pictures = apiResult.map((e) => PictureViewModel(e)).toList();
  }
}

class PictureViewModel {
  final PicsumModel? picsumModel;

  PictureViewModel(this.picsumModel);
}
