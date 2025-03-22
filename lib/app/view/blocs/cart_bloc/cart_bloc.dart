import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:menu_loyalty/app/core/exception/exception.dart';
import 'package:menu_loyalty/app/data/datasources/repositories.dart';
import 'package:menu_loyalty/app/data/models/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository;

  CartBloc({required CartRepository cartRepository})
      : _cartRepository = cartRepository,
        super(const CartState.emptyCart()) {
    on<StartedCart>(_startedCart);
    on<AddedItem>(_addItem);
    on<RemoveItem>(_removeItem);
  }

  void _startedCart(StartedCart event, Emitter<CartState> emit) async {
    emit(const CartLoading());
    final failureOrCart = await _cartRepository.getCart();
    failureOrCart.fold(
      (failure) {
        emit(
          CartState.cartLoadFailure(LocalException(message: failure.message)),
        );
      },
      (cart) {
        if (cart.menuItems.isEmpty) {
          emit(
            const CartState.emptyCart(),
          );
        } else {
          emit(
            CartState.cartLoadSuccess(cart),
          );
        }
      },
    );
  }

  void _addItem(AddedItem event, Emitter<CartState> emit) async {
    final failureOrCart = await _cartRepository.addMenuItem(event.menuModel);

    failureOrCart.fold(
      (failure) {
        emit(
          CartState.cartLoadFailure(LocalException(message: failure.message)),
        );
      },
      (cart) {
        emit(
          CartState.cartLoadSuccess(cart),
        );
      },
    );
  }

  void _removeItem(RemoveItem event, Emitter<CartState> emit) async {
    final failureOrCart = await _cartRepository.removeMenuItem(event.menuModel);

    failureOrCart.fold(
      (failure) {
        emit(
          CartState.cartLoadFailure(LocalException(message: failure.message)),
        );
      },
      (cart) {
        if (cart.menuItems.isEmpty) {
          emit(
            const CartState.emptyCart(),
          );
        } else {
          emit(
            CartState.cartLoadSuccess(cart),
          );
        }
      },
    );
  }
}
