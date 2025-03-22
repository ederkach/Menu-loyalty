import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/data/models/models.dart';
import 'package:menu_loyalty/app/view/blocs/blocs.dart';
import 'package:menu_loyalty/app/view/widgets/qty_button.dart';

class ActionBlocWidget extends StatelessWidget {
  const ActionBlocWidget({
    required this.menuModel,
    required this.cartModel,
    Key? key,
  }) : super(key: key);

  final MenuModel menuModel;
  final MenuModel cartModel;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);

    return Padding(
      padding: EdgeInsets.only(
        top: sizer.hwt(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (cartModel.id != null)
                SizedBox(
                  width: sizer.w(35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () =>
                            context.read<CartBloc>().add(AddedItem(cartModel)),
                        splashColor:
                            designColorScheme.primary.withValues(alpha: 0.5),
                        child: QtyButton(
                          title: '+',
                          background: designColorScheme.secondary,
                        ),
                      ),
                      Text(
                        cartModel.quantity.toString(),
                        style: designStyleText.bodyMedium!.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: designColorScheme.onSecondary),
                      ),
                      InkWell(
                        onTap: () => BlocProvider.of<CartBloc>(context)
                            .add(RemoveItem(cartModel)),
                        splashColor: designColorScheme.onSecondary
                            .withValues(alpha: 0.3),
                        child: QtyButton(
                          title: '-',
                          background: designColorScheme.secondaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              if (cartModel.id == null)
                SizedBox(
                  width: sizer.w(35),
                  height: sizer.hwt(70),
                ),
              Container(
                height: sizer.hwt(43),
                width: sizer.w(143),
                child: Center(
                    child: Text(
                  'Try promo code',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: designStyleText.bodyMedium!.copyWith(
                      fontSize: 15, color: designColorScheme.onPrimary),
                )),
                decoration: const BoxDecoration(
                  color: Color(0xFFFF9800),
                  borderRadius: BorderRadius.all(
                    Radius.circular(26),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: sizer.hwt(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Prices',
                      maxLines: 2,
                      style: designStyleText.titleLarge!.copyWith(
                          fontSize: 17, color: designColorScheme.onSecondary),
                    ),
                    SizedBox(
                      height: sizer.hwt(10),
                    ),
                    Text(
                      (cartModel.quantity != 0 && cartModel.quantity != null)
                          ? '${cartModel.currency} ${cartModel.total}'
                          : '${menuModel.currency} ${menuModel.price.toString()}',
                      maxLines: 2,
                      style: designStyleText.titleLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: designColorScheme.secondary),
                    ),
                  ],
                ),
                SizedBox(
                  width: sizer.w(50),
                ),
                Text(
                  'Add to Cart',
                  style: designStyleText.titleLarge!.copyWith(
                      fontSize: 17, color: designColorScheme.onSecondary),
                ),
                SizedBox(
                  width: sizer.w(10),
                ),
                Container(
                  height: sizer.w(72),
                  width: sizer.w(72),
                  child: TextButton(
                    onPressed: () {
                      if (cartModel.id == null) {
                        BlocProvider.of<CartBloc>(context)
                            .add(AddedItem(menuModel));
                      }
                    },
                    child: Icon(
                      EvaIcons.shoppingBagOutline,
                      color: designColorScheme.onPrimary,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: designColorScheme.primary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(26),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
