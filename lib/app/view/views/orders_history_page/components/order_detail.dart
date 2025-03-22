import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../../widgets/green_small_button.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CachedNetworkImage(
          imageUrl:
              'https://firebasestorage.googleapis.com/v0/b/menubonus.appspot.com/o/Replace%20images4.png?alt=media&token=9c18bdee-5c4d-40ce-8d05-4ee61caa7a68',
          placeholder: (context, url) => GlowingProgressIndicator(
              child:
                  const ImageIcon(AssetImage('assets/icons/loadingIcon.png'))),
          errorWidget: (context, url, error) =>
              const ImageIcon(AssetImage('assets/icons/loadingIcon.png')),
          width: sizer.w(88),
          height: sizer.w(88),
        ),
        Text(
          'Mokaa Cokiees Vanilla',
          maxLines: 1,
          style: designStyleText.titleLarge!
              .copyWith(fontSize: 18, color: designColorScheme.onSecondary),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\$ 15,45',
              maxLines: 2,
              style: designStyleText.titleLarge!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: designColorScheme.secondary),
            ),
            SizedBox(
              width: sizer.w(20),
            ),
            Text(
              'Total Prices',
              maxLines: 2,
              style: designStyleText.titleLarge!.copyWith(
                  fontSize: 13,
                  color: designColorScheme.onSecondary.withValues(alpha: 0.5)),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            GreenSmallButton(
              isSelected: false,
              title: 'Detail',
            ),
            GreenSmallButton(
              isSelected: true,
              title: 'Track Order',
            ),
          ],
        ),
      ],
    );
  }
}
