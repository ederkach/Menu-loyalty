import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_loyalty/src/config/size_config.dart';

import '../../../blocs/blocs.dart';
import '../../../widgets/button_up_dark.dart';
import 'list_offer_dish.dart';
import 'empty_list_offer_dish.dart';

class HomeBottomPanel extends StatelessWidget {
  const HomeBottomPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return Container(
      width: sizer.w(375),
      height: sizer.hwt(390),
      child: Padding(
        padding: EdgeInsets.only(
          top: sizer.hwt(22),
        ),
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'MenuPage');
                },
                child: const ButtonUpDark()),
            const SizedBox(),
            BlocBuilder<MenuOfferBloc, MenuOfferState>(
              builder: (context, state) {
                return state.maybeWhen(
                  menuFilteredCategory: (listMenu) => ListOfferDish(
                    listMenu: listMenu,
                  ),
                  orElse: () => const EmptyListOffer(
                    name: '.....',
                  ),
                );
              },
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: designColorScheme.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
    );
  }
}
