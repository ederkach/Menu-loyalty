import '../menu_model/menu_model.dart';

class Cart {
  Cart({required this.menuItems});

  List<MenuModel> menuItems;

  double get subtotal => menuItems.fold(
      0, (total, current) => total + (current.price! * current.quantity!));

  double get quantity => menuItems.fold(
      0, (totalQuantity, current) => totalQuantity + current.quantity!);

  @override
  List<Object> get props => [menuItems];

  static empty() {}
}

extension ItemListExtensions on List<MenuModel> {
  bool containsId(String? id) {
    return firstWhere(
          (element) => element.id == id,
          orElse: () => MenuModel.empty(),
        ) !=
        MenuModel.empty();
  }
}

extension IterableExtensions<T> on Iterable<T> {
  Iterable<T> replaceWhere(
      bool Function(T element) predicate, T Function(T value) replace) {
    return map(
      (element) => predicate(element) ? replace(element) : element,
    );
  }
}
