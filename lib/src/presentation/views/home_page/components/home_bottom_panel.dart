import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BottomPanel(
      width: 375,
      height: 404,
      bottomButtonWidgets: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'MenuPage');
          },
          child: const ButtonUpDark()),
      supportWidgets: const SizedBox(),
      bottomPanelListWidgets: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          return state.maybeWhen(
            menuFilteredCaregory: (listMenu) => ListOffer(
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
