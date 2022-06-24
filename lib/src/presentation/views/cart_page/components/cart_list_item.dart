import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:menu_loyalty/src/config/size_config.dart';
import 'package:menu_loyalty/src/data/models/menu_model/menu_model.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../../blocs/blocs.dart';
import '../../../widgets/qty_button.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({
    required this.menuModel,
    Key? key,
  }) : super(key: key);

  final MenuModel menuModel;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return SizedBox(
      width: sizer.w(327),
      height: sizer.hwt(78),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: sizer.w(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                  imageUrl: menuModel.imagePath.toString(),
                  placeholder: (context, url) => GlowingProgressIndicator(
                      child: const ImageIcon(
                          AssetImage('assets/icons/loadingIcon.png'))),
                  errorWidget: (context, url, error) => const ImageIcon(
                      AssetImage('assets/icons/loadingIcon.png')),
                  width: sizer.w(88),
                  height: sizer.hwt(72),
                ),
              ),
              width: sizer.w(88),
              height: sizer.hwt(72),
              decoration: BoxDecoration(
                color: designColorScheme.secondaryContainer,
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
            ),
            SizedBox(
              width: sizer.w(16),
            ),
            SizedBox(
              width: sizer.w(150),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    menuModel.name,
                    maxLines: 1,
                    style: designStyleText.bodyMedium!.copyWith(fontSize: 14),
                  ),
                  Text(
                    'Romano cheese',
                    overflow: TextOverflow.clip,
                    style: designStyleText.bodyMedium!.copyWith(
                        fontSize: 12, color: designColorScheme.secondary),
                  ),
                  Text(
                    '${menuModel.currency.toString()}${menuModel.price.toString()}',
                    style: designStyleText.bodyMedium?.copyWith(
                        color: designColorScheme.secondary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: sizer.w(35),
            ),
            SizedBox(
              width: sizer.w(35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => BlocProvider.of<CartBloc>(context)
                        .add(AddedItem(menuModel)),
                    splashColor: designColorScheme.primary.withOpacity(0.5),
                    child: QtyButton(
                      title: '+',
                      background: designColorScheme.secondary,
                    ),
                  ),
                  Text(
                    menuModel.quantity.toString(),
                    style: designStyleText.bodyMedium!.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: designColorScheme.onSecondary),
                  ),
                  InkWell(
                    onTap: () => BlocProvider.of<CartBloc>(context)
                        .add(RemoveItem(menuModel)),
                    splashColor: designColorScheme.onSecondary.withOpacity(0.3),
                    child: QtyButton(
                      title: '-',
                      background: designColorScheme.secondaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
