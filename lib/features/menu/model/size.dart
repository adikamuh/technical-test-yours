class MenuSize {
  final int id;
  final String name;
  final num modifier;

  const MenuSize({
    required this.id,
    required this.name,
    required this.modifier,
  });
}

const MenuSize small = MenuSize(
  id: 1,
  name: 'Small',
  modifier: -1,
);

const MenuSize medium = MenuSize(
  id: 2,
  name: 'Medium',
  modifier: 0,
);

const MenuSize large = MenuSize(
  id: 3,
  name: 'Large',
  modifier: 2.0,
);

const List<MenuSize> menuSizes = [small, medium, large];
