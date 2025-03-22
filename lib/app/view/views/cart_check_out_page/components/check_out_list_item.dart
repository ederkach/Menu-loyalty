import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/data/models/models.dart';
import 'package:progress_indicators/progress_indicators.dart';

class CheckOutListItem extends StatelessWidget {
  const CheckOutListItem({
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
      height: sizer.hwt(74),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                imageUrl: menuModel.imagePath.toString(),
                placeholder: (context, url) => GlowingProgressIndicator(
                    child: const ImageIcon(
                        AssetImage('assets/icons/loadingIcon.png'))),
                errorWidget: (context, url, error) =>
                    const ImageIcon(AssetImage('assets/icons/loadingIcon.png')),
                width: sizer.w(116),
                height: sizer.hwt(116),
              ),
            ),
            width: sizer.w(72),
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
                  style: designStyleText.bodyMedium!.copyWith(fontSize: 17),
                ),
                Text(
                  menuModel.hashtags.toString(),
                  style: designStyleText.bodyMedium!.copyWith(
                      fontSize: 13, color: designColorScheme.secondary),
                ),
                Text(
                  '${menuModel.currency.toString()}${menuModel.price.toString()}',
                  style: designStyleText.bodyMedium?.copyWith(
                      color: designColorScheme.secondary,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            width: sizer.w(35),
            child: Text(
              menuModel.quantity.toString(),
              style: designStyleText.bodyMedium!.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: designColorScheme.onSecondary),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
