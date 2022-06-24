// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

import '../menu_model/menu_model.dart';

// part 'cart_model.freezed.dart';
// part 'cart_model.g.dart';

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


// @freezed
// abstract class Cart implements _$Cart {
//   const Cart._();
//   const factory Cart({
//     final String? id,
//     @Default(<MenuModel>[]) final List<MenuModel>? menuItems,
//   }) = _Cart;

//   factory Cart.empty() => const Cart(menuItems: []);

//   factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

//   factory Cart.fromDocument(
//       DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
//     final data = documentSnapshot.data()!;
//     return Cart.fromJson(data).copyWith(id: documentSnapshot.id);
//   }

//   Map<String, dynamic> toDocument() => toJson()..remove('id');
// }
