import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:menu_loyalty/src/core/error/exception.dart';

import '../../../data/datasources/remote/repositories/repositories.dart';
import '../../../data/models/menu_model/menu_model.dart';

part 'menu_offer_event.dart';
part 'menu_offer_state.dart';
part 'menu_offer_bloc.freezed.dart';

class MenuOfferBloc extends Bloc<MenuOfferEvent, MenuOfferState> {
  final MenuRepository _menuRepository;

  MenuOfferBloc({required MenuRepository menuRepository})
      : _menuRepository = menuRepository,
        super(const MenuOfferState.emptyMenu()) {
    on<FetchMenu>(_onLoadMenu);
    on<FilterByCategoryOffer>(_choseCategory);
  }

  void _onLoadMenu(FetchMenu event, Emitter<MenuOfferState> emit) async {
    emit(
      const MenuOfferState.menuLoading(),
    );

    final dataMenuRepository = await _menuRepository.getMenu();

    emit(
      dataMenuRepository.fold(
        (failure) => MenuOfferState.menuLoadFailure(
            ServerException(message: failure.message)),
        (menuList) => MenuOfferState.menuFilteredCategory(menuList),
      ),
    );
  }

  void _choseCategory(
      FilterByCategoryOffer event, Emitter<MenuOfferState> emit) {
    emit(
      const MenuOfferState.menuLoading(),
    );
    List<MenuModel> filterCategoryOffer = _menuRepository.repositoryMenu
        .where((e) => e.categoriesOffer!
            .where((element) => element == event.idCategoryOffer)
            .isNotEmpty)
        .toList();

    emit(
      MenuOfferState.menuFilteredCategory(filterCategoryOffer),
    );
  }
}
