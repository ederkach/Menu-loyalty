import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';
import 'package:progress_indicators/progress_indicators.dart';

class DishItemCentre extends StatelessWidget {
  const DishItemCentre({
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return Container(
      height: sizer.hwt(155),
      width: sizer.w(155),
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: sizer.w(25), vertical: sizer.hwt(2)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Cooked with egg Sweet Cookies dr r rjk mjrm jkr',
                        maxLines: 2,
                        style: designStyleText.bodyMedium?.copyWith(
                            color: (isSelected == true)
                                ? designColorScheme.onPrimary
                                : designColorScheme.onSecondary,
                            fontSize: 12),
                      ),
                      Text(
                        '\$51',
                        style: designStyleText.bodyMedium?.copyWith(
                            color: designColorScheme.secondary, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
              height: sizer.hwt(90),
              width: sizer.w(155),
              decoration: BoxDecoration(
                color: (isSelected == true)
                    ? designColorScheme.primary
                    : designColorScheme.secondaryContainer,
                borderRadius: const BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
            ),
          ),
          Positioned(
            right: 32,
            child: CachedNetworkImage(
              imageUrl:
                  'https://firebasestorage.googleapis.com/v0/b/menubonus.appspot.com/o/Replace%20images4.png?alt=media&token=9c18bdee-5c4d-40ce-8d05-4ee61caa7a68',
              placeholder: (context, url) => GlowingProgressIndicator(
                  child: const ImageIcon(
                      AssetImage('assets/icons/loadingIcon.png'))),
              errorWidget: (context, url, error) =>
                  const ImageIcon(AssetImage('assets/icons/loadingIcon.png')),
              height: sizer.hwt(88),
              width: sizer.w(88),
            ),
          ),
        ],
      ),
    );
  }
}
