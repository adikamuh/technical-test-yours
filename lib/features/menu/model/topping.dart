class Topping {
  final int id;
  final String name;
  final num price;

  const Topping({
    required this.id,
    required this.name,
    required this.price,
  });
}

const Topping avocado = Topping(
  id: 1,
  name: 'Avocado',
  price: 1.0,
);

const Topping broccoli = Topping(
  id: 2,
  name: 'Broccoli',
  price: 1.0,
);

const Topping onions = Topping(
  id: 3,
  name: 'Onions',
  price: 1.0,
);

const Topping zucchini = Topping(
  id: 4,
  name: 'Zucchini',
  price: 1.0,
);

const Topping lobster = Topping(
  id: 5,
  name: 'Lobster',
  price: 2.0,
);

const Topping oyster = Topping(
  id: 6,
  name: 'Oyster',
  price: 2.0,
);

const Topping salmon = Topping(
  id: 7,
  name: 'salmon',
  price: 2.0,
);

const Topping tuna = Topping(
  id: 8,
  name: 'Tuna',
  price: 2.0,
);

const Topping bacon = Topping(
  id: 9,
  name: 'Bacon',
  price: 3.0,
);

const Topping duck = Topping(
  id: 10,
  name: 'Duck',
  price: 3.0,
);

const Topping ham = Topping(
  id: 11,
  name: 'Ham',
  price: 3.0,
);

const Topping sausage = Topping(
  id: 12,
  name: 'Sausage',
  price: 3.0,
);

const List<Topping> toppings = [
  avocado,
  broccoli,
  onions,
  zucchini,
  lobster,
  oyster,
  salmon,
  tuna,
  bacon,
  duck,
  ham,
  sausage,
];
