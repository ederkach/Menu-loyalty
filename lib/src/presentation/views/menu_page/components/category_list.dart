import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_loyalty/src/config/size_config.dart';
import 'package:menu_loyalty/src/data/models/categories_model/categories_model.dart';

import '../../../blocs/blocs.dart';
import '../widgets/category_item.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({
    required this.listCategories,
    Key? key,
  }) : super(key: key);

  final List<Categories>? listCategories;

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int _selectedIndex = 0;

  void selectIndex(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
        top: sizer.hwt(20),
      ),
      child: SizedBox(
        height: sizer.hwt(45),
        width: sizer.w(334),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: widget.listCategories!.length,
          separatorBuilder: (BuildContext context, int index) =>
              VerticalDivider(
            color: designColorScheme.onPrimary,
            width: sizer.w(5),
          ),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: GestureDetector(
                onTap: (() {
                  selectIndex(index);
                  BlocProvider.of<MainMenuBloc>(context).add(FilterByCategory(
                      widget.listCategories![index].id.toString()));
                }),
                child: CategoryItem(
                    categoriesModel: widget.listCategories![index],
                    isSelected: (index == _selectedIndex) ? true : false),
              ),
            );
          },
        ),
      ),
    );
  }
}
