class Food {
  String name;
  String image;
  String description;
  String price;
  String rating;

  Food({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
  });
  String get _name => name;
  String get _description => description;
  String get _image => image;
  String get _price => price;
  String get _rating => rating;
}
