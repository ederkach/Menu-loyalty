import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/blocs.dart';
import '../../../widgets/bottom_panel.dart';
import '../../../widgets/button_up_dark.dart';
import 'list_offer.dart';

class HomeBottomPanel extends StatelessWidget {
  const HomeBottomPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        return state.maybeWhen(
          menuLoading: () => const Center(),
          emptyMenu: () => const Center(),
          menuLoadSuccess: (listMenu) => BottomPanel(
            width: 375,
            height: 404,
            bottomButtonWidgets: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'MenuPage');
                },
                child: const ButtonUpDark()),
            supportWidgets: const SizedBox(),
            bottomPanelListWidgets: ListOffer(
              listMenu: listMenu,
            ),
          ),
          menuLoadFailure: (failure) => const Center(),
          orElse: () => const Center(),
        );
      },
    );
  }
}
