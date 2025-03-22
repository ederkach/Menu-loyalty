part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.startedCart() = StartedCart;
  const factory CartEvent.addedItem(MenuModel menuModel) = AddedItem;
  const factory CartEvent.removeItem(MenuModel menuModel) = RemoveItem;
}
