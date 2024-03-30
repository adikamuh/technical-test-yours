import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yours_technical_test/features/menu/bloc/state_controller.dart';
import 'package:yours_technical_test/features/menu/model/menu.dart';
import 'package:yours_technical_test/features/menu/model/size.dart';
import 'package:yours_technical_test/features/menu/model/topping.dart';

part 'menu_page_bloc.g.dart';

@CopyWith()
class MenuState extends Equatable {
  final Menu selectedMenu;
  final MenuSize selectedSize;
  final List<Topping> selectedToppings;
  final num totalPrice;

  const MenuState({
    required this.selectedMenu,
    required this.selectedSize,
    required this.selectedToppings,
    required this.totalPrice,
  });

  @override
  List<Object> get props => [selectedMenu, selectedSize, selectedToppings];
}

class MenuPageCubit extends Cubit<StateController<MenuState>> {
  MenuPageCubit() : super(StateController.idle());

  void init() {
    emit(StateController.loading(data: state.inferredData));
    emit(
      StateController.success(
        MenuState(
            selectedMenu: pizza1,
            selectedSize: medium,
            selectedToppings: const [],
            totalPrice: _totalPriceCalculation(
              selectedMenu: pizza1,
              selectedSize: medium,
              selectedToppings: const [],
            )),
      ),
    );
  }

  void selectMenu(Menu menu) {
    emit(StateController.loading(data: state.inferredData));
    emit(
      StateController.success(
        state.inferredData!.copyWith(
          selectedMenu: menu,
          selectedToppings: [],
          totalPrice: _totalPriceCalculation(
            selectedMenu: menu,
            selectedSize: state.inferredData!.selectedSize,
            selectedToppings: [],
          ),
        ),
      ),
    );
  }

  void selectSize(MenuSize size) {
    emit(StateController.loading(data: state.inferredData));
    emit(
      StateController.success(
        state.inferredData!.copyWith(
          selectedSize: size,
          totalPrice: _totalPriceCalculation(
            selectedMenu: state.inferredData!.selectedMenu,
            selectedSize: size,
            selectedToppings: state.inferredData!.selectedToppings,
          ),
        ),
      ),
    );
  }

  void selectTopping(Topping topping) {
    emit(StateController.loading(data: state.inferredData));
    final List<Topping> selectedToppings = state.inferredData!.selectedToppings;
    if (selectedToppings.contains(topping)) {
      selectedToppings.remove(topping);
    } else {
      selectedToppings.add(topping);
    }
    emit(
      StateController.success(
        state.inferredData!.copyWith(
          selectedToppings: selectedToppings,
          totalPrice: _totalPriceCalculation(
            selectedMenu: state.inferredData!.selectedMenu,
            selectedSize: state.inferredData!.selectedSize,
            selectedToppings: selectedToppings,
          ),
        ),
      ),
    );
  }

  num _totalPriceCalculation({
    required Menu selectedMenu,
    required MenuSize selectedSize,
    required List<Topping> selectedToppings,
  }) {
    num totalPrice = selectedMenu.price;
    totalPrice += selectedSize.modifier;
    totalPrice += selectedToppings.fold<num>(
        0, (previousValue, element) => previousValue + element.price);
    return totalPrice;
  }
}
