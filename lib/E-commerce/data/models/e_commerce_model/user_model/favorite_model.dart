class FavoriteModel {
  final int id;
  final String name;
  final String price;
  final String image;

  FavoriteModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.image});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
    };
  }

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
    );
  }
}
