class Product {
  String category;
  String name;
  String description;
  String price;
  Product(this.category, this.name, this.description, this.price);

  @override
  String toString() {
    // TODO: implement toString
    return "[$category, $name, $description,$price]";
  }
}
