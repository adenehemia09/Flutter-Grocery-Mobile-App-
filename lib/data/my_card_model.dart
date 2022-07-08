class MyCardModel {
  final String image;
  final String title;
  final String type;
  final double price;
  final int count;

  const MyCardModel({
    required this.image,
    required this.title,
    required this.type,
    required this.price,
    required this.count,
  });
}

List<MyCardModel> myCardList = [];
