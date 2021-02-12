class CarouselModel {
  String image;
  CarouselModel(this.image);
}

List<CarouselModel> carousels=
carouselsData.map((item)=>CarouselModel(item['image'])).toList();

var carouselsData=[
  {"image": "assets/icons/bible1.png"},
  {"image": "assets/icons/bible2.png"},
  {"image": "assets/icons/bible3.png"},
];