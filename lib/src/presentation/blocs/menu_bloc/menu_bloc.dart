import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:menu_loyalty/src/core/error/exception.dart';
import 'package:menu_loyalty/src/data/repositories/menu/menu_repository.dart';

import '../../../data/models/menu_model/menu_model.dart';

part 'menu_event.dart';
part 'menu_state.dart';
part 'menu_bloc.freezed.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuRepository _menuRepository;

  MenuBloc({required MenuRepository menuRepository})
      : _menuRepository = menuRepository,
        super(const MenuState.emptyMenu()) {
    on<FetchMenu>(_onLoadMenu);
    on<ChoseCategory>(_choseCategory);
  }

  void _onLoadMenu(FetchMenu event, Emitter<MenuState> emit) async {
    emit(
      const MenuState.menuLoading(),
    );

    final dataMenuRepository = await _menuRepository.getMenu();

    emit(
      dataMenuRepository.fold(
        (failure) => MenuState.menuLoadFailure(
            ServerException(message: failure.message)),
        (menuList) => MenuState.menuFilteredCaregory(menuList),
      ),
    );
  }

  FutureOr<void> _choseCategory(ChoseCategory event, Emitter<MenuState> emit) {
    List<MenuModel> filterCategoryOffer = _menuRepository.repositoryMenu
        .where((e) => e.categoriesOffer!
            .where((element) => element == event.idCategory)
            .isNotEmpty)
        .toList();

    emit(
      MenuState.menuFilteredCaregory(filterCategoryOffer),
    );
  }
}
