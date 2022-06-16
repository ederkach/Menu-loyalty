import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_loyalty/src/config/size_config.dart';

import '../../../blocs/blocs.dart';
import '../../../widgets/bottom_panel.dart';
import '../../../widgets/button_up_dark.dart';
import 'list_offer.dart';
import 'load_list_offer.dart';

class HomeBottomPanel extends StatelessWidget {
  const HomeBottomPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizer = MediaQuery.of(context);
    return BottomPanel(
      width: sizer.w(375),
      height: sizer.hwt(420),
      bottomButtonWidgets: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'MenuPage');
          },
          child: const ButtonUpDark()),
      supportWidgets: const SizedBox(),
      bottomPanelListWidgets: BlocBuilder<MenuOfferBloc, MenuOfferState>(
        builder: (context, state) {
          return state.maybeWhen(
            menuFilteredCategory: (listMenu) => ListOffer(
              listMenu: listMenu,
            ),
            orElse: () => const LoadListOffer(
              name: '.....',
            ),
          );
        },
      ),
    );
  }
}
