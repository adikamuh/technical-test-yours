import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yours_technical_test/features/menu/bloc/menu_page_bloc.dart';
import 'package:yours_technical_test/features/menu/bloc/state_controller.dart';
import 'package:yours_technical_test/features/menu/model/menu.dart';
import 'package:yours_technical_test/features/menu/model/size.dart';
import 'package:yours_technical_test/features/menu/model/topping.dart';
import 'package:yours_technical_test/features/menu/ui/widget/menu_item_widget.dart';
import 'package:yours_technical_test/features/menu/ui/widget/size_item_widget.dart';
import 'package:yours_technical_test/features/menu/ui/widget/topping_item_widget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late final MenuPageCubit _menuBlocCubit;

  @override
  void initState() {
    super.initState();
    _menuBlocCubit = context.read<MenuPageCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<MenuPageCubit, StateController<MenuState>>(
          bloc: _menuBlocCubit,
          builder: (context, state) {
            if (state is Success) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Pizza",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildMenus(state.inferredData!.selectedMenu),
                      const SizedBox(height: 20),
                      const Text(
                        "Size",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildSizes(state.inferredData!.selectedSize),
                      const SizedBox(height: 20),
                      const Text(
                        "Toppings",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildToppings(
                        state.inferredData!.selectedToppings,
                        state.inferredData!.selectedMenu,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Price",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "\$ ${state.inferredData!.totalPrice.toStringAsFixed(0)}",
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildMenus(Menu selectedMenu) {
    return Row(
      children: [
        ...menus
            .expand((menu) {
              return [
                Expanded(
                  child: MenuItemWidget(
                    menu: menu,
                    groupValue: selectedMenu,
                    onChanged: (value) {
                      _menuBlocCubit.selectMenu(menu);
                    },
                  ),
                ),
                const SizedBox(width: 10),
              ];
            })
            .toList()
            .sublist(0, (menus.length * 2) - 1)
      ],
    );
  }

  Widget _buildSizes(MenuSize selectedSize) {
    return Row(
      children: [
        ...menuSizes
            .expand((menuSize) {
              return [
                Expanded(
                  child: SizeItemWidget(
                    menuSize: menuSize,
                    groupValue: selectedSize,
                    onChanged: (_) {
                      _menuBlocCubit.selectSize(menuSize);
                    },
                  ),
                ),
                const SizedBox(width: 10),
              ];
            })
            .toList()
            .sublist(0, (menuSizes.length * 2) - 1)
      ],
    );
  }

  Widget _buildToppings(List<Topping> selectedToppings, Menu selectedMenu) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ...toppings
            .expand((topping) {
              late final bool isEnable;
              late final bool value;
              if (selectedMenu.toppings.contains(topping)) {
                isEnable = true;
              } else {
                isEnable = false;
              }

              if (selectedToppings.contains(topping)) {
                value = true;
              } else {
                value = false;
              }
              return [
                ToppingItemWidget(
                  topping: topping,
                  value: value,
                  enable: isEnable,
                  onChanged: (value, topping) {
                    _menuBlocCubit.selectTopping(topping);
                  },
                ),
                const SizedBox(width: 10),
              ];
            })
            .toList()
            .sublist(0, (toppings.length * 2) - 1)
      ],
    );
  }
}
