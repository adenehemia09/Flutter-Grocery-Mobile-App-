class VegetableModel {
  final String image;
  final String title;
  final int width;
  final double price;

  VegetableModel({
    required this.image,
    required this.title,
    required this.width,
    required this.price,
  });
}

var vegetableModelList = [
  VegetableModel(
    image:
        "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Vegetables%2Fone-fresh-red-tomato-isolated-white-removebg-preview.png?alt=media&token=c9329dbd-146b-46fd-8883-e360ff161b47",
    title: "Tomato",
    width: 30,
    price: 4.55,
  ),
  VegetableModel(
    image:
        "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Vegetables%2Fbanana.jpg?alt=media&token=7bcd814c-4254-4143-a09b-65a5d3007dd9",
    title: "Banana",
    width: 30,
    price: 4.55,
  ),
];
