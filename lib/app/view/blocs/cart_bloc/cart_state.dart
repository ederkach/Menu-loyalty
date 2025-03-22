part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.emptyCart() = EmptyCart;
  const factory CartState.cartLoading() = CartLoading;
  const factory CartState.cartLoadFailure(LocalException failure) =
      CartLoadFailure;
  const factory CartState.cartLoadSuccess(Cart cart) = CartLoadSuccess;
}
