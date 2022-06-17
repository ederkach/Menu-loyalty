import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../../../data/models/menu_model/menu_model.dart';

class CategoryDishItem extends StatelessWidget {
  const CategoryDishItem({
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
      height: sizer.hwt(90),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.all(
                sizer.w(8),
              ),
              child: CachedNetworkImage(
                imageUrl: menuModel.imagePath.toString(),
                placeholder: (context, url) => GlowingProgressIndicator(
                    child: const ImageIcon(
                        AssetImage('assets/icons/loadingIcon.png'))),
                errorWidget: (context, url, error) =>
                    const ImageIcon(AssetImage('assets/icons/loadingIcon.png')),
              ),
            ),
            width: sizer.w(155),
            height: sizer.hwt(90),
            decoration: BoxDecoration(
              color: designColorScheme.secondaryContainer,
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                menuModel.name,
                style: designStyleText.bodyMedium!.copyWith(fontSize: 17),
              ),
              Text(
                'Romano cheese',
                style: designStyleText.bodyMedium!
                    .copyWith(fontSize: 13, color: designColorScheme.secondary),
              ),
              Text(
                '\$${menuModel.price.toString()}',
                style: designStyleText.bodyMedium?.copyWith(
                    color: designColorScheme.secondary,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
