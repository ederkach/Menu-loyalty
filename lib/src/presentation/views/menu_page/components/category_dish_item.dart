import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

class CategoryDishItem extends StatelessWidget {
  const CategoryDishItem({
    Key? key,
  }) : super(key: key);

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
                imageUrl:
                    'https://firebasestorage.googleapis.com/v0/b/menubonus.appspot.com/o/Replace%20images4.png?alt=media&token=9c18bdee-5c4d-40ce-8d05-4ee61caa7a68',
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
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
                'Orange Panglazed',
                style: designStyleText.bodyMedium!.copyWith(fontSize: 17),
              ),
              Text(
                'Romano cheese',
                style: designStyleText.bodyMedium!
                    .copyWith(fontSize: 13, color: designColorScheme.secondary),
              ),
              Text(
                '\$51,00',
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
