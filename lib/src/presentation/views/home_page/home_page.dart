import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/button_up_dark.dart';
import '../../widgets/label_widget.dart';
import '../../widgets/search_input_widget.dart';
import 'components/category_offer.dart';
import 'components/greetings_widget.dart';
import 'components/list_offer.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: CircleAvatar(
            radius: 32.r,
            backgroundImage: const NetworkImage(
                'https://www.mockofun.com/wp-content/uploads/2019/12/circle-photo.jpg'), //AssetImage loads image URL.
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  EvaIcons.bellOutline,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GreetingsWidget(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const SearchInputWidget(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const LabelWidget(
                    label: 'Category offer',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const CategoryOffer(),
                  SizedBox(
                    height: 22.h,
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 22.0.h),
                child: Column(
                  children: const [
                    ButtonUpDark(),
                    ListOffer(),
                  ],
                ),
              ),
              width: 375.w,
              height: 404.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}