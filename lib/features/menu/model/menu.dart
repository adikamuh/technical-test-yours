import 'package:yours_technical_test/features/menu/model/topping.dart';

class Menu {
  final int id;
  final String name;
  final String imageAsset;
  final num price;
  final List<Topping> toppings;

  const Menu({
    required this.id,
    required this.name,
    required this.imageAsset,
    required this.price,
    required this.toppings,
  });
}

const Menu pizza1 = Menu(
  id: 1,
  name: 'Pizza 1',
  imageAsset: 'assets/images/pizza1.jpg',
  price: 8.0,
  toppings: [avocado, broccoli, onions, zucchini, tuna, ham],
);

const Menu pizza2 = Menu(
  id: 2,
  name: 'Pizza 2',
  imageAsset: 'assets/images/pizza2.jpg',
  price: 10.0,
  toppings: [broccoli, onions, zucchini, lobster, oyster, salmon, bacon, ham],
);

const Menu pizza3 = Menu(
  id: 3,
  name: 'Pizza 3',
  imageAsset: 'assets/images/pizza3.jpg',
  price: 12.0,
  toppings: [broccoli, onions, zucchini, tuna, bacon, duck, ham, sausage],
);

const List<Menu> menus = [pizza1, pizza2, pizza3];