import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_loyalty/app/data/models/models.dart';
import 'package:menu_loyalty/app/view/blocs/blocs.dart';

import 'category_list.dart';
import 'empty_category_list.dart';

class ControlCategories extends StatelessWidget {
  const ControlCategories({
    Key? key,
  }) : super(key: key);

  updateMenuList(BuildContext context, List<Categories> listCategories) {
    context.read<MainMenuBloc>()
      ..add(FilterByCategory(listCategories.first.id.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoriesBloc, CategoriesState>(
      listener: (context, state) {
        state.whenOrNull(
          categoriesLoadSuccess: (listCategories) =>
              updateMenuList(context, listCategories),
        );
      },
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          return state.maybeWhen(
            categoriesLoadSuccess: (listCategories) => CategoryList(
              listCategories: listCategories,
            ),
            orElse: () => const EmptyCategoryList(),
          );
        },
      ),
    );
  }
}
