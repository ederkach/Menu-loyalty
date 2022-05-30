import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'list_offer_item.dart';

class ListOffer extends StatefulWidget {
  const ListOffer({
    Key? key,
  }) : super(key: key);

  @override
  State<ListOffer> createState() => _ListOfferState();
}

class _ListOfferState extends State<ListOffer> {
  int _selectedIndex = 0;

  void selectIndex(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0.h),
      child: SizedBox(
        width: 327.w,
        height: 206.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          separatorBuilder: (BuildContext context, int index) =>
              VerticalDivider(
            color: Theme.of(context).colorScheme.primary,
            width: 17.w,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: GestureDetector(
                  onTap: (() {
                    selectIndex(index);
                  }),
                  child: ListOfferItem(
                      isSelected: (index == _selectedIndex) ? true : false)),
            );
          },
        ),
      ),
    );
  }
}
