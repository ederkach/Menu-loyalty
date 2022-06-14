import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../blocs/blocs.dart';
import 'list_category_offer.dart';
import 'load_list_categories_offer.dart';

class CategoryOffer extends StatelessWidget {
  const CategoryOffer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      height: 92.h,
      child: BlocListener<CategoriesofferBloc, CategoriesofferState>(
        listener: (context, state) {
          state.whenOrNull(
            categoriesOfferLoadSuccess: (listCategoriesOffer) =>
                BlocProvider.of<MenuBloc>(context)
                  ..add(ChoseCategory(listCategoriesOffer.first.id.toString())),
          );
        },
        child: BlocBuilder<CategoriesofferBloc, CategoriesofferState>(
          builder: (context, state) {
            return state.when(
              categoriesOfferLoading: () => const LoadCategoriesOffer(
                nameIcon: 'Load...',
              ),
              emptyCategoriesOffer: () => const LoadCategoriesOffer(
                nameIcon: 'No data',
              ),
              categoriesOfferLoadSuccess: (listCategoriesOffer) =>
                  ListCategoryOffer(
                listCategoriesOffer: listCategoriesOffer,
              ),
              categoriesOfferStateLoadFailure: (failure) =>
                  const LoadCategoriesOffer(
                nameIcon: 'No data',
              ),
            );
          },
        ),
      ),
    );
  }
}
