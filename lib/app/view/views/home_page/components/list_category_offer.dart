import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/data/models/models.dart';
import 'package:menu_loyalty/app/view/blocs/blocs.dart';
import 'package:menu_loyalty/app/view/widgets/icon_menu_button.dart';

class ListCategoryOffer extends StatefulWidget {
  const ListCategoryOffer({Key? key, required this.listCategoriesOffer})
      : super(key: key);

  final List<CategoriesOffer> listCategoriesOffer;

  @override
  State<ListCategoryOffer> createState() => _ListCategoryOfferState();
}

class _ListCategoryOfferState extends State<ListCategoryOffer> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void selectIndex(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: widget.listCategoriesOffer.length,
      separatorBuilder: (BuildContext context, int index) => VerticalDivider(
        color: designColorScheme.onPrimary,
        width: sizer.w(17),
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: (() {
              selectIndex(index);
              context.read<MenuOfferBloc>().add(FilterByCategoryOffer(
                  widget.listCategoriesOffer[index].id.toString()));
            }),
            child: IconMenuButton(
                categoriesOffer: widget.listCategoriesOffer[index],
                dotColor: designColorScheme.onSecondary,
                isSelected: (index == _selectedIndex) ? true : false));
      },
    );
  }
}
