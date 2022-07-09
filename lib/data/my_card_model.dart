class MyCardModel {
  late String id;
  final String image;
  final String title;
  final String type;
  late double price;
  late int count;

  MyCardModel({
    required this.id,
    required this.image,
    required this.title,
    required this.type,
    required this.price,
    required this.count,
  });
}

List<MyCardModel> myCardList = [];
