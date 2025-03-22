import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/data/models/models.dart';
import 'package:menu_loyalty/app/view/blocs/blocs.dart';

import 'description.dart';
import 'action_bloc.dart';
import 'spec.dart';

class BottomDishPanel extends StatelessWidget {
  const BottomDishPanel({
    required this.menuModel,
    Key? key,
  }) : super(key: key);

  final MenuModel menuModel;

  _dishInCart(String modelId, List<MenuModel> cartList) {
    if (cartList.isEmpty) {
      return const MenuModel(name: 'name');
    } else {
      return cartList.firstWhere(
        (element) => element.id.toString() == modelId,
        orElse: () => const MenuModel(name: 'name'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return Positioned(
      bottom: 0,
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(
              top: sizer.hwt(22), left: sizer.w(24), right: sizer.w(24)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpecDishWidget(
                kkal: menuModel.kkal.toString(),
                weight: menuModel.weight.toString(),
              ),
              DescriptionWidget(description: menuModel.description.toString()),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    cartLoadSuccess: (cart) => ActionBlocWidget(
                      cartModel:
                          _dishInCart(menuModel.id.toString(), cart.menuItems),
                      menuModel: menuModel,
                    ),
                    orElse: () => ActionBlocWidget(
                      cartModel:
                          _dishInCart(menuModel.id.toString(), <MenuModel>[]),
                      menuModel: menuModel,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        height: sizer.h(475),
        width: sizer.w(375),
        decoration: BoxDecoration(
          color: designColorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
      ),
    );
  }
}
