import 'package:acourse/presentation/resource/constants_manager.dart';
import 'package:acourse/presentation/resource/image_assets_manager.dart';
import 'package:acourse/presentation/resource/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
   int currentIndex=0;
  final List<SliderObject> _list =
  [
    SliderObject(
        title: ConstantsManager.onBoardingTitle1,
        subTitle: ConstantsManager.onBoardingSubTitle1,
        image: AssetsImageManager.onBoardingImage1
    ),
    SliderObject(
        title: ConstantsManager.onBoardingTitle2,
        subTitle: ConstantsManager.onBoardingSubTitle2,
        image:AssetsImageManager.onBoardingImage2
    ),
    SliderObject(
        title: ConstantsManager.onBoardingTitle3,
        subTitle:ConstantsManager.onBoardingSubTitle3 ,
        image:AssetsImageManager.onBoardingImage3
    ),
    SliderObject(
        title: ConstantsManager.onBoardingTitle4,
        subTitle:ConstantsManager.onBoardingSubTitle4 ,
        image:AssetsImageManager.onBoardingImage4
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemBuilder: (context,index)=>Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _list[index].title,
              style: Theme.of(context).textTheme.displayLarge,
            ),
           const SizedBox(
              height: AppSize.s12,
            ),
            Text(
              _list[index].subTitle,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
           const SizedBox(
             height: AppSize.s60,
           ),
            SvgPicture.asset(_list[index].image)
          ],
        ),
      ),

    itemCount: _list.length,
    onPageChanged: (index)
    {
    setState(() {
    currentIndex=index;
    });
      },
    )
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(
      {required this.title, required this.subTitle, required this.image});
}
