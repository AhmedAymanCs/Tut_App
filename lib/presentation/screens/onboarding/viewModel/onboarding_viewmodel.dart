import 'dart:async';
import 'package:acourse/domain/model/models.dart';
import 'package:acourse/presentation/base/baseviewmodel.dart';
import 'package:acourse/presentation/resource/constants_manager.dart';
import 'package:acourse/presentation/resource/image_assets_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInput, OnBoardingViewModelOutput {
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;

  int _currentIndex = 0;

  @override
  void start() {
    _list = _getSliderData();
    _pushDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  //input functions
  @override
  void onPageChanged(int index) {
    _currentIndex = index;
  }

  //private view functions
  List<SliderObject> _getSliderData() => [
        SliderObject(
            title: ConstantsManager.onBoardingTitle1,
            subTitle: ConstantsManager.onBoardingSubTitle1,
            image: AssetsImageManager.onBoardingImage1),
        SliderObject(
            title: ConstantsManager.onBoardingTitle2,
            subTitle: ConstantsManager.onBoardingSubTitle2,
            image: AssetsImageManager.onBoardingImage2),
        SliderObject(
            title: ConstantsManager.onBoardingTitle3,
            subTitle: ConstantsManager.onBoardingSubTitle3,
            image: AssetsImageManager.onBoardingImage3),
        SliderObject(
            title: ConstantsManager.onBoardingTitle4,
            subTitle: ConstantsManager.onBoardingSubTitle4,
            image: AssetsImageManager.onBoardingImage4),
      ];

  void _pushDataToView() {
    inputSliderViewObject
        .add(SliderViewObject(_list, _currentIndex, _list.length));
  }

  @override
  // input stream controller
  Sink get inputSliderViewObject => _streamController.sink;

  // output stream controller
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);
}

abstract class OnBoardingViewModelInput {
  void onPageChanged(int index); //when swipe screen

  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutput {
  Stream<SliderViewObject> get outputSliderViewObject;
}
