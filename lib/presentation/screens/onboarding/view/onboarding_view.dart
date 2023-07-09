import 'package:acourse/domain/model/models.dart';
import 'package:acourse/presentation/resource/color_manager.dart';
import 'package:acourse/presentation/resource/constants_manager.dart';
import 'package:acourse/presentation/resource/routes_manager.dart';
import 'package:acourse/presentation/resource/values_manager.dart';
import 'package:acourse/presentation/screens/onboarding/viewModel/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
        stream: _viewModel.outputSliderViewObject,
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorManager.primary,
              ),
            );
          } else {
            return _getBuildWidget(snapshots.data!);
          }
        });
  }

  Widget _getBuildWidget(SliderViewObject sliderViewObject) => Scaffold(
        backgroundColor: ColorManager.white,
        body: PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) =>
              OnBoardingBuilder(sliderViewObject.sliderObject[index]),
          itemCount: sliderViewObject.numOfSlides,
          onPageChanged: (index) {},
        ),
        bottomSheet: Container(
          color: ColorManager.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text(
                    ConstantsManager.skip,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: ColorManager.primary),
                    textAlign: TextAlign.end,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                ),
              ),
              _bottomSheetBuilder(sliderViewObject.numOfSlides),
            ],
          ),
        ),
      );

  Widget _bottomSheetBuilder(int numOfSlides) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              _pageController.previousPage(
                  duration:
                      const Duration(seconds: ConstantsManager.durationDelay),
                  curve: Curves.fastOutSlowIn);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: ColorManager.white,
              size: AppSize.s20,
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: numOfSlides,
            effect: ExpandingDotsEffect(
                dotColor: ColorManager.white,
                activeDotColor: ColorManager.white,
                dotWidth: AppSize.s8,
                dotHeight: AppSize.s8,
                expansionFactor: AppSize.s2),
          ),
          IconButton(
            onPressed: () {
              _pageController.nextPage(
                  duration:
                      const Duration(seconds: ConstantsManager.durationDelay),
                  curve: Curves.fastOutSlowIn);
            },
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: ColorManager.white,
              size: AppSize.s20,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

class OnBoardingBuilder extends StatelessWidget {
  final SliderObject onBoarding;

  const OnBoardingBuilder(this.onBoarding, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: AppSize.s60,
          ),
          Text(
            onBoarding.title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Text(
            onBoarding.subTitle,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: AppSize.s60,
          ),
          SvgPicture.asset(onBoarding.image),
        ],
      ),
    );
  }
}
