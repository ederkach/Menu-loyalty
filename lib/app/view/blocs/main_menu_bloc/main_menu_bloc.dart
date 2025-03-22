import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:menu_loyalty/app/core/exception/exception.dart';
import 'package:menu_loyalty/app/data/datasources/repositories.dart';
import 'package:menu_loyalty/app/data/models/models.dart';

part 'main_menu_event.dart';
part 'main_menu_state.dart';
part 'main_menu_bloc.freezed.dart';

class MainMenuBloc extends Bloc<MainMenuEvent, MainMenuState> {
  final MenuRepository _menuRepository;

  MainMenuBloc({
    required MenuRepository menuRepository,
  })  : _menuRepository = menuRepository,
        super(const MainMenuState.emptyMainMenu()) {
    on<FetchMainMenu>(_onLoadMenu);
    on<FilterByCategory>(_choseCategory);
  }

  void _onLoadMenu(FetchMainMenu event, Emitter<MainMenuState> emit) async {
    emit(
      const MainMenuState.mainMenuLoading(),
    );

    final dataMenuRepository = await _menuRepository.getMenu();

    dataMenuRepository.fold(
      (failure) {
        emit(
          MainMenuState.mainMenuLoadFailure(
              ServerException(message: failure.message)),
        );
      },
      (listMainMenu) {
        emit(
          MainMenuState.mainMenuLoadSuccess(listMainMenu),
        );
      },
    );
  }

  void _choseCategory(FilterByCategory event, Emitter<MainMenuState> emit) {
    try {
      emit(
        const MainMenuState.mainMenuLoading(),
      );
      List<MenuModel> filterMenuByCategory = _menuRepository.repositoryMenu
          .where((e) => e.categories!
              .where((element) => element == event.idCategory)
              .isNotEmpty)
          .toList();

      List<MenuModel> filterMenuOfferByCategory = _menuRepository.repositoryMenu
          .where((e) => e.categories!
              .where((element) =>
                  element == event.idCategory && e.offerToday == true)
              .isNotEmpty)
          .toList();

      emit(
        MainMenuState.mainMenuFilteredByCategory(
            filterMenuByCategory, filterMenuOfferByCategory),
      );
    } catch (e) {
      emit(
        const MainMenuState.mainMenuLoadFailure(ServerException()),
      );
    }
  }
}
