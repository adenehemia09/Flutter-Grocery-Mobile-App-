class CategoryModel {
  final String image;
  final String title;
  final int width;
  final double price;

  CategoryModel({
    required this.image,
    required this.title,
    required this.width,
    required this.price,
  });
}

var vegetableModelList = [
  CategoryModel(
    image:
        "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Vegetables%2Fone-fresh-red-tomato-isolated-white-removebg-preview.png?alt=media&token=c9329dbd-146b-46fd-8883-e360ff161b47",
    title: "Tomato",
    width: 30,
    price: 41.55,
  ),
  CategoryModel(
    image:
        "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Vegetables%2Fchinese-cabbage__1_-removebg-preview.png?alt=media&token=44f1cbe1-b5de-415f-aee8-1e1474271caf",
    title: "Cabbage",
    width: 30,
    price: 42.55,
  ),
];

var fruitsModelList = [
  CategoryModel(
    image:
        "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Vegetables%2Fbanana__1_-removebg-preview.png?alt=media&token=9d8da3cd-2b1f-47d5-9441-1ac86895104f",
    title: "Banana",
    width: 30,
    price: 47.49,
  ),
  CategoryModel(
    image:
        "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Fruits%2Fapples-red-fresh-mellow-juicy-perfect-whole-white-desk-removebg-preview.png?alt=media&token=698c9a05-0ef5-44b4-bbfc-8624131c0446",
    title: "Apple",
    width: 30,
    price: 32.74,
  ),
  CategoryModel(
    image:
        "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Fruits%2Ffresh-watermelon-removebg-preview.png?alt=media&token=cdda74e8-7059-46ba-b8b0-d9b49b18b785",
    title: "watermelon",
    width: 30,
    price: 58.56,
  ),
];

var fishModelList = [
  CategoryModel(
    image:
        "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Fish%2Fslice-raw-salmon-removebg-preview.png?alt=media&token=dd23b757-6c7b-4ef8-a30f-e497e2b5d2a9",
    title: "Fresh Salmon",
    width: 90,
    price: 46.55,
  ),
  CategoryModel(
    image:
        "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Fish%2Ffresh-fish-mackerel-removebg-preview.png?alt=media&token=bae71d0d-4717-4fc9-bfc0-3ad28c2739f5",
    title: "Fresh Mackerel",
    width: 89,
    price: 60.49,
  ),
];

var breadModelList = [
  CategoryModel(
    image:
        "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Bread%2Fhomemade-crunchy-bread-with-grains-removebg-preview.png?alt=media&token=ddf82c49-e496-4097-8a09-7aa5ff94150d",
    title: "crunchy bread",
    width: 70,
    price: 100.55,
  ),
  CategoryModel(
    image:
        "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Bread%2Fdelicious-bread-made-from-good-wheat-removebg-preview.png?alt=media&token=5b0900f4-9c25-49b3-857a-90837c609605",
    title: "Delicious bread",
    width: 50,
    price: 120.49,
  ),
  CategoryModel(
    image:
        "https://firebasestorage.googleapis.com/v0/b/grocery-apps-mobile.appspot.com/o/Bread%2Ffresh-bread-removebg-preview.png?alt=media&token=97d47a63-77d7-41c5-9918-8473642f2bce",
    title: "crunchy bread",
    width: 60,
    price: 90.55,
  ),
];
