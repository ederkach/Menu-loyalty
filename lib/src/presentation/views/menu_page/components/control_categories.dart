import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/blocs.dart';
import 'category_list.dart';

class ControlCategories extends StatelessWidget {
  const ControlCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoriesBloc, CategoriesState>(
      listener: (context, state) {
        state.whenOrNull(
          categoriesLoadSuccess: (listCategories) =>
              BlocProvider.of<MainMenuBloc>(context)
                ..add(FilterByCategory(listCategories.first.id.toString())),
        );
      },
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          return state.maybeWhen(
            categoriesLoadSuccess: (listCategories) => CategoryList(
              listCategories: listCategories,
            ),
            orElse: () => const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
