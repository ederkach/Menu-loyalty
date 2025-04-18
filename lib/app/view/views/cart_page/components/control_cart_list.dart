import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_loyalty/app/view/blocs/blocs.dart';

import 'cart_list.dart';

class ControlCartList extends StatelessWidget {
  const ControlCartList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designStyleText = Theme.of(context).textTheme;
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return state.when(
            cartLoading: () => const CircularProgressIndicator(),
            emptyCart: () => Center(
                  child: Text('Your cart is empty (((',
                      style:
                          designStyleText.titleLarge!.copyWith(fontSize: 16)),
                ),
            cartLoadSuccess: (cart) => CartList(
                  cart: cart,
                ),
            cartLoadFailure: (failure) => Container());
      },
    );
  }
}
