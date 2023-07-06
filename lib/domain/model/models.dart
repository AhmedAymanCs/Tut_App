class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(
      {required this.title, required this.subTitle, required this.image});
}
class SliderObjectView
{
   SliderObject  sliderObject;
   int numOfSlides;
   int currentIndex;
   SliderObjectView(this.sliderObject,this.currentIndex,this.numOfSlides);

}