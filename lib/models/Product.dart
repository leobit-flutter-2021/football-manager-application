import 'dart:collection';

import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final num price;
  final String imgUrl;
  final color;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imgUrl,
      @required this.color});
}

class ProductDataProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p3',
      title: 'Frenkie de Jong',
      description: 'This player is included in the transfer plan of our club!',
      price: 100.00,
      imgUrl: 'https://s-cdn.sportbox.ru/images/styles/upload/fp_fotos/fa/18/93ea58b30f741f80947b044ea4327d405d1fac2ba69dd630264493.jpg',
      color: '0xFFFFF59D',
    ),
    Product(
      id: 'p1',
      title: 'Ruben Dias',
      description: 'This player is included in the transfer plan of our club!',
      price: 85.00,
      imgUrl: 'https://i2.wp.com/futbik.com/wp-content/uploads/2020/09/ruben-dias-first-interview-written.jpg?resize=650%2C350',
      color: '0xFFBBDEFB',
    ),
    Product(
      id: 'p2',
      title: 'Erling Haaland',
      description: 'This player is included in the transfer plan of our club!',
      price: 160.00,
      imgUrl: 'https://www.readfootball.com/sites/default/files/news-img/9cc0630a7e.jpg',
      color: '0xFFF8BBD0',
    ),
    Product(
      id: 'p4',
      title: 'Jan Oblak',
      description: 'This player is included in the transfer plan of our club!',
      price: 90.00,
      imgUrl: 'https://ss.sport-express.ru/userfiles/materials/157/1579507/large.jpg',
      color: '0xFFCCFF90',
    ),
  ];

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  Product getElementById(String id) =>
      _items.singleWhere((value) => value.id == id);
}
