import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

import '../../data/models/categories_offer_model/categories_offer_model.dart';
import 'dot_widget.dart';

class IconMenuButton extends StatelessWidget {
  const IconMenuButton({
    required this.isSelected,
    required this.dotColor,
    required this.categoriesOffer,
    Key? key,
  }) : super(key: key);

  final bool isSelected;
  final Color dotColor;
  final CategoriesOffer categoriesOffer;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return Container(
      height: sizer.hwt(90),
      width: sizer.w(155),
      padding: EdgeInsets.symmetric(
        vertical: sizer.w(10),
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          if (isSelected == true)
            Positioned(
                top: sizer.hwt(7),
                right: sizer.w(17),
                child: DotWidget(
                  dotColor: dotColor,
                  sizeheight: sizer.hwt(9),
                  sizewidth: sizer.w(9),
                )),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImageIcon(
                AssetImage(categoriesOffer.iconPath),
                color: (isSelected == true)
                    ? designColorScheme.onPrimary
                    : Theme.of(context).iconTheme.color,
                size: 24,
              ),
              Text(
                categoriesOffer.name,
                style: (isSelected == true)
                    ? designStyleText.bodyMedium?.copyWith(
                        color: designColorScheme.secondaryContainer,
                        fontSize: 13)
                    : designStyleText.bodyMedium?.copyWith(
                        color: designColorScheme.onSecondary.withOpacity(0.5),
                        fontSize: 13),
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: (isSelected == true)
            ? designColorScheme.secondary
            : designColorScheme.secondaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        boxShadow: isSelected == true
            ? const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0),
                )
              ]
            : null,
      ),
    );
  }
}
