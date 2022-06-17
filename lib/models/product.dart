class Product {
  final String name;
  final String id;



  String get getName {
    return name;
  }

  String get getId {
    return id;
  }

  @override
  String toString() {
    return "name: ${this.name}, id: ${this.id}";
  }

  Product(this.name, this.id);
}
