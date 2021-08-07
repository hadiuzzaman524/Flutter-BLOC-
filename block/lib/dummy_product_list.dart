
class DummyProductList{
  static List<Product> products =[
    Product(
      image: "https://picsum.photos/200",
      name: "Apple",
      price: 120,
    ),
    Product(
      image: "https://picsum.photos/200",
      name: "Banana",
      price: 100,
    ),
    Product(
      image: "https://picsum.photos/200",
      name: "Orange",
      price: 80,
    ),
    Product(
      image: "https://picsum.photos/200",
      name: "Dragon Fruit",
      price: 800,
    ),
  ];
}

class Product{
  final String image;
  final String name;
  final double price;

  Product({required this.name,required this.image,required this.price});
}