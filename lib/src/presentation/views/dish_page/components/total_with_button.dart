import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_loyalty/src/config/size_config.dart';
import 'package:menu_loyalty/src/presentation/blocs/cart_bloc/cart_bloc.dart';

import '../../../../data/models/menu_model/menu_model.dart';

class TotalWithButtonWidget extends StatelessWidget {
  const TotalWithButtonWidget({
    required this.menuModel,
    Key? key,
  }) : super(key: key);

  final MenuModel menuModel;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return Padding(
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
                style: designStyleText.headline6!.copyWith(
                    fontSize: 17, color: designColorScheme.onSecondary),
              ),
              SizedBox(
                height: sizer.hwt(10),
              ),
              Text(
                '\$ 15,45',
                maxLines: 2,
                style: designStyleText.headline6!.copyWith(
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
            style: designStyleText.headline6!
                .copyWith(fontSize: 17, color: designColorScheme.onSecondary),
          ),
          SizedBox(
            width: sizer.w(10),
          ),
          Container(
            height: sizer.w(72),
            width: sizer.w(72),
            child: TextButton(
              onPressed: () {
                BlocProvider.of<CartBloc>(context).add(AddedItem(menuModel));
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
    );
  }
}
