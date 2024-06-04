class Product {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  Product({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.images,
    this.inFavorites,
    this.inCart,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int?,
        price: json['price'] as int?,
        oldPrice: json['old_price'] as int?,
        discount: json['discount'] as int?,
        image: json['image'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        images: json['images'] as List<String>?,
        inFavorites: json['in_favorites'] as bool?,
        inCart: json['in_cart'] as bool?,
      );
}
