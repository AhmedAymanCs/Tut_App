class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(
      {required this.title, required this.subTitle, required this.image});
}

class SliderViewObject {
  List<SliderObject> sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.currentIndex, this.numOfSlides);
}

//login model
class Customer
{
  int id;
  String name;
  int numOfNotifications;

  Customer(this.id,this.name,this.numOfNotifications);

}

class Contact
{
  String phone;
  String email;
  String link;

  Contact(this.phone,this.email,this.link);
}

class Authentication
{
  Customer? customer;
  Contact? contact;

  Authentication(this.customer,this.contact);
}