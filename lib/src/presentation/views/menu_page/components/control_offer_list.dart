import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_loyalty/src/config/size_config.dart';

import '../../../blocs/blocs.dart';
import 'category_list_offer.dart';
import 'empty_category_list_offer.dart';

class ControlOfferList extends StatelessWidget {
  const ControlOfferList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizer = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
        top: sizer.hwt(10),
      ),
      child: BlocBuilder<MainMenuBloc, MainMenuState>(
        builder: (context, state) {
          return state.maybeMap(
              mainMenuFilteredByCategory:
                  (MainMenuFilteredByCategory stateResult) => CategoryListOffer(
                      listMenuOffer: stateResult.listOfferMenu),
              orElse: () => const EmptyCategoryListOffer());
        },
      ),
    );
  }
}
