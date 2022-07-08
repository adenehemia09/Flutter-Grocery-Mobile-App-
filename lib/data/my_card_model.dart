class MyCardModel {
  final String image;
  final String title;
  final String type;
  final double price;

  const MyCardModel({
    required this.image,
    required this.title,
    required this.type,
    required this.price,
  });
}

var myCardList = const [
  MyCardModel(
    image:
        "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Fruits%2Fstrawberry-isolated-white-background-close-up.jpg?alt=media&token=13c791a9-d03e-45b6-b4e4-4516e34ed2ed",
    title: "Strawberry",
    type: "Fruits",
    price: 4.55,
  ),
  MyCardModel(
    image:
        "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Vegetables%2Fone-fresh-red-tomato-isolated-white-removebg-preview.png?alt=media&token=c9329dbd-146b-46fd-8883-e360ff161b47",
    title: "Tomato",
    type: "Vegetable",
    price: 4.55,
  ),
  MyCardModel(
    image:
        "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/ads%2Fsausages-dough-removebg-preview.png?alt=media&token=c02ca8f0-bfba-4b6d-aec4-21aa28019071",
    title: "Fresh Bread",
    type: "Bread",
    price: 47.49,
  ),
  MyCardModel(
    image:
        "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Fish%2Fslice-raw-salmon-removebg-preview.png?alt=media&token=dd23b757-6c7b-4ef8-a30f-e497e2b5d2a9",
    title: "Fresh Salmon",
    type: "Fish",
    price: 46.55,
  ),
  MyCardModel(
    image:
        "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Vegetables%2Fbanana__1_-removebg-preview.png?alt=media&token=9d8da3cd-2b1f-47d5-9441-1ac86895104f",
    title: "Banana",
    type: "Fruit",
    price: 47.49,
  ),
];
