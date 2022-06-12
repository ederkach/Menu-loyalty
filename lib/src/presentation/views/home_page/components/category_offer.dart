import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../blocs/categories_offer_bloc/bloc/blocs.dart';
import 'list_category_offer.dart';
import 'load_categories_offer.dart';

class CategoryOffer extends StatelessWidget {
  const CategoryOffer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      height: 92.h,
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
            categoriesOfferStateLoadFailure: (_itemsBloc) =>
                const LoadCategoriesOffer(
              nameIcon: 'No data',
            ),
          );
        },
      ),
    );
  }
}
