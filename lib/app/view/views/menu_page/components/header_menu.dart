import 'package:flutter/material.dart';

import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/core/constants/enums.dart';
import 'package:menu_loyalty/app/view/widgets/button_up_grey.dart';
import 'package:menu_loyalty/app/view/widgets/label_widget.dart';
import 'package:menu_loyalty/l10n/l10n.dart';

import 'control_categories.dart';
import 'control_offer_list.dart';

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({
    Key? key,
    required this.scrollVisibility,
  }) : super(key: key);

  final bool scrollVisibility;

  @override
  Widget build(BuildContext context) {
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);

    return Column(
      children: [
        const ButtonUpGrey(),
        Row(
          children: [
            Text(context.l10n.categoryTitle,
                style: designStyleText.displayMedium!
                    .copyWith(fontSize: 26, fontWeight: FontWeight.w500)),
          ],
        ),
        const ControlCategories(),
        if (scrollVisibility) const ControlOfferList(),
        if (scrollVisibility)
          Padding(
            padding: EdgeInsets.only(
              top: sizer.hwt(10),
              bottom: sizer.hwt(10),
            ),
            child: LabelWidget(
              label: context.l10n.categoryOfferLabel,
              darkWhite: DarkWhite.dark,
            ),
          ),
      ],
    );
  }
}
