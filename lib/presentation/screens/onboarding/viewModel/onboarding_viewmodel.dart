import 'dart:async';

import 'package:acourse/domain/model/models.dart';
import 'package:acourse/presentation/base/baseviewmodel.dart';

class OnBoardingViewModel extends BaseViewModel with
OnBoardingViewModelInput,OnBoardingViewModelOutput
{
  StreamController _streamController= StreamController<SliderObjectView>();
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }

  @override
  void start() {
    // TODO: implement start
  }
  @override
  void goNext()
  {
    // TODO: implement goNext
  }
  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => throw UnimplementedError();

  @override
  // TODO: implement outputSliderViewObject
  Stream get outputSliderViewObject => throw UnimplementedError();


}

abstract class OnBoardingViewModelInput
{
  void onPageChanged(int index);

  void goNext(); // when press right arrow or slide left
  void goPrevious();// when press left arrow or slide right

Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutput
{

Stream get outputSliderViewObject;
}