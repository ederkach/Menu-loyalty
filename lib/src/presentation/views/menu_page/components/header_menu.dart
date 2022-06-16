import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

import '../../../../constants/enums.dart';
import '../../../widgets/button_up_grey.dart';
import '../../../widgets/label_widget.dart';
import 'category_list.dart';
import 'category_list_offer.dart';

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
        SizedBox(
          height: sizer.hwt(18),
        ),
        const ButtonUpGrey(),
        SizedBox(
          height: sizer.hwt(10),
        ),
        Row(
          children: [
            Text('Category 🌭',
                style: designStyleText.displayMedium!
                    .copyWith(fontSize: 26, fontWeight: FontWeight.w500)),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: sizer.hwt(20),
          ),
          child: const CategoryList(),
        ),
        if (scrollVisibility)
          Padding(
            padding: EdgeInsets.only(
              top: sizer.hwt(10),
            ),
            child: const CategoryListOffer(),
          ),
        if (scrollVisibility)
          Padding(
            padding: EdgeInsets.only(
              top: sizer.hwt(10),
              bottom: sizer.hwt(10),
            ),
            child: const LabelWidget(
              label: 'Category offer',
              darkWhite: DarkWhite.dark,
            ),
          ),
      ],
    );
  }
}
