import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../blocs/categories_offer_bloc/bloc/blocs.dart';
import '../../../widgets/icon_menu_button.dart';

class CategoryOffer extends StatefulWidget {
  const CategoryOffer({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryOffer> createState() => _CategoryOfferState();
}

class _CategoryOfferState extends State<CategoryOffer> {
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
    return SizedBox(
      width: 327.w,
      height: 92.h,
      child: BlocBuilder<CategoriesofferBloc, CategoriesofferState>(
        builder: (context, state) {
          return state.when(
            categoriesOfferLoading: () =>
                const Center(child: CircularProgressIndicator()),
            emptyCategoriesOffer: () =>
                const Center(child: CircularProgressIndicator()),
            categoriesOfferLoadSuccess: (listCategoriesOffer) =>
                ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: listCategoriesOffer.length,
              separatorBuilder: (BuildContext context, int index) =>
                  VerticalDivider(
                color: Theme.of(context).colorScheme.onPrimary,
                width: 17.w,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: (() {
                      selectIndex(index);
                    }),
                    child: IconMenuButton(
                        categoriesOffer: listCategoriesOffer[index],
                        dotColor: Theme.of(context).colorScheme.onSecondary,
                        isSelected: (index == _selectedIndex) ? true : false));
              },
            ),
            categoriesOfferStateLoadFailure: (_itemsBloc) =>
                const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
