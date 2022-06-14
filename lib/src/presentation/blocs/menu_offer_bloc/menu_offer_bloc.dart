import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:menu_loyalty/src/core/error/exception.dart';
import 'package:menu_loyalty/src/data/repositories/menu/menu_repository.dart';

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
    on<ChoseCategory>(_choseCategory);
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
        (menuList) => MenuOfferState.menuFilteredCaregory(menuList),
      ),
    );
  }

  FutureOr<void> _choseCategory(
      ChoseCategory event, Emitter<MenuOfferState> emit) {
    List<MenuModel> filterCategoryOffer = _menuRepository.repositoryMenu
        .where((e) => e.categoriesOffer!
            .where((element) => element == event.idCategory)
            .isNotEmpty)
        .toList();

    emit(
      MenuOfferState.menuFilteredCaregory(filterCategoryOffer),
    );
  }
}
