import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/view/app_router/mobile/app_router.dart';
import 'package:menu_loyalty/app/view/blocs/blocs.dart';
import 'package:menu_loyalty/app/view/widgets/button_up_dark.dart';

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
                  MenuPageRoute().push(context);
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
