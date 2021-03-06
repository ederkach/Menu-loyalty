import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_loyalty/src/config/size_config.dart';

import '../../../blocs/blocs.dart';
import 'list_category_offer.dart';
import 'empty_list_categories_offer.dart';

class ControlCategoryOffer extends StatelessWidget {
  const ControlCategoryOffer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizer = MediaQuery.of(context);
    return SizedBox(
      width: sizer.w(327),
      height: sizer.hwt(92),
      child: BlocListener<CategoriesOfferBloc, CategoriesOfferState>(
        listener: (context, state) {
          state.whenOrNull(
            categoriesOfferLoadSuccess: (listCategoriesOffer) =>
                BlocProvider.of<MenuOfferBloc>(context)
                  ..add(FilterByCategoryOffer(
                      listCategoriesOffer.first.id.toString())),
          );
        },
        child: BlocBuilder<CategoriesOfferBloc, CategoriesOfferState>(
          builder: (context, state) {
            return state.when(
              categoriesOfferLoading: () => const EmptyListCategoriesOffer(
                nameIcon: 'Load...',
              ),
              emptyCategoriesOffer: () => const EmptyListCategoriesOffer(
                nameIcon: 'No data',
              ),
              categoriesOfferLoadSuccess: (listCategoriesOffer) =>
                  ListCategoryOffer(
                listCategoriesOffer: listCategoriesOffer,
              ),
              categoriesOfferStateLoadFailure: (failure) =>
                  const EmptyListCategoriesOffer(
                nameIcon: 'No data',
              ),
            );
          },
        ),
      ),
    );
  }
}
