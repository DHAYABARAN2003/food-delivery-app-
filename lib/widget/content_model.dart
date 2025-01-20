class unbordingcontent {
  String image;
  String title;
  String description;
  unbordingcontent(
      {required this.description, required this.image, required this.title});
}

List<unbordingcontent> contents = [
  unbordingcontent(
      description: 'Pick your food from our menu\n    More then 35 times',
      image: 'images/logo.png',
      title: 'Select from our \n   Best menu'),
  unbordingcontent(
      description:
          'you can pay cash on delivery and\n card payment is available',
      image: 'images/vada.jpg',
      title: 'Easy and online payment'),
  unbordingcontent(
      description: 'Deliver your food at your at your\n Door step',
      image: 'images/burger.jpg',
      title: 'quick Delivery at Your Doorstep')
];
