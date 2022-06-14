import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/categories_offer_model/categories_offer_model.dart';
import '../../../blocs/blocs.dart';
import '../../../widgets/icon_menu_button.dart';

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
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: widget.listCategoriesOffer.length,
      separatorBuilder: (BuildContext context, int index) => VerticalDivider(
        color: designColorScheme.onPrimary,
        width: 17.w,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: (() {
              selectIndex(index);
              BlocProvider.of<MenuOfferBloc>(context).add(FilterByCategoryOffer(
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
