import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Column(
      children: [
        SizedBox(
          height: 18.h,
        ),
        const ButtonUpGrey(),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Text('Category 🌭',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 26, fontWeight: FontWeight.w500)),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0.h),
          child: const CategoryList(),
        ),
        if (scrollVisibility)
          Padding(
            padding: EdgeInsets.only(top: 10.0.h),
            child: const CategoryListOffer(),
          ),
        if (scrollVisibility)
          Padding(
            padding: EdgeInsets.only(top: 20.0.h, bottom: 10.h),
            child: const LabelWidget(
              label: 'Category offer',
              darkWhite: DarkWhite.dark,
            ),
          ),
      ],
    );
  }
}
