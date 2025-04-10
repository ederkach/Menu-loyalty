import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/data/models/models.dart';
import 'package:progress_indicators/progress_indicators.dart';

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
      width: sizer.w(327),
      child: Row(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.all(
                sizer.w(8),
              ),
              child: CachedNetworkImage(
                width: sizer.w(10),
                height: sizer.w(10),
                imageUrl: menuModel.imagePath.toString(),
                placeholder: (context, url) => GlowingProgressIndicator(
                    child: const ImageIcon(
                        AssetImage('assets/icons/loadingIcon.png'))),
                errorWidget: (context, url, error) =>
                    const ImageIcon(AssetImage('assets/icons/loadingIcon.png')),
              ),
            ),
            width: sizer.w(155),
            height: sizer.w(90),
            decoration: BoxDecoration(
              color: designColorScheme.secondaryContainer,
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          ),
          SizedBox(
            width: sizer.w(10),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: Text(
                  menuModel.name,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  style: designStyleText.bodyMedium!.copyWith(fontSize: 15),
                ),
              ),
              Text(
                menuModel.hashtags.toString(),
                style: designStyleText.bodyMedium!
                    .copyWith(fontSize: 13, color: designColorScheme.secondary),
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
        ],
      ),
    );
  }
}
