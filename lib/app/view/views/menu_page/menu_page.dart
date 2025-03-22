import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import 'components/body_panel.dart';
import 'components/category_list_dish.dart';
import 'components/empty_category_list_dish.dart';
import 'components/header_menu.dart';
import 'widgets/home_button.dart';

class MenuPage extends StatefulWidget {
  static const String routeName = 'MenuPage';

  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final ScrollController scrollcontroller = ScrollController();

  bool scrollVisibility = true;

  @override
  initState() {
    scrollcontroller.addListener(() {
      if (scrollcontroller.position.pixels > 5) {
        setState(() {
          scrollVisibility = false;
        });
      } else {
        setState(() {
          scrollVisibility = true;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollcontroller;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: designColorScheme.secondaryContainer,
      body: BodyPanel(
        childWidget: Column(
          children: [
            HeaderMenu(scrollVisibility: scrollVisibility),
            BlocBuilder<MainMenuBloc, MainMenuState>(
              builder: (context, state) {
                return state.maybeMap(
                    mainMenuFilteredByCategory:
                        (MainMenuFilteredByCategory stateResult) =>
                            CategoryListDish(
                                scrollcontroller: scrollcontroller,
                                listMenu: stateResult.listFilteredMainMenu),
                    orElse: () => const EmptyCategoryListDish());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: const HomeButton(),
    );
  }
}
