import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/check_out_list_item.dart';

class CheckOutList extends StatefulWidget {
  const CheckOutList({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckOutList> createState() => _CheckOutListState();
}

class _CheckOutListState extends State<CheckOutList> {
  int _selectedIndex = 0;

  void selectIndex(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: designColorScheme.background,
          height: 30.w,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (() {
              selectIndex(index);
            }),
            child: const CheckOutListItem(),
          );
        },
      ),
    );
  }
}
