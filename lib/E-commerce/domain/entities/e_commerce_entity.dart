class ECommerceEntity {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ECommerceEntity(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});
}
