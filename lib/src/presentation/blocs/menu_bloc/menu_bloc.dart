import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:menu_loyalty/src/core/error/exception.dart';
import 'package:menu_loyalty/src/data/repositories/menu/menu_repository.dart';

import '../../../data/models/menu_model/menu_model.dart';
import '../blocs.dart';

part 'menu_event.dart';
part 'menu_state.dart';
part 'menu_bloc.freezed.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuRepository _menuRepository;
  final CategoriesofferBloc _categoriesOfferBloc;
  late StreamSubscription? _categoriesOfferSubscription;

  MenuBloc(
      {required MenuRepository menuRepository,
      required CategoriesofferBloc categoriesOfferBloc})
      : _menuRepository = menuRepository,
        _categoriesOfferBloc = categoriesOfferBloc,
        super(const MenuState.emptyMenu()) {
    on<FetchMenu>(_onLoadMenu);
  }

  void _onLoadMenu(FetchMenu event, Emitter<MenuState> emit) async {
    final dataMenuRepository = await _menuRepository.getMenu();

    emit(
      dataMenuRepository.fold(
        (failure) => MenuState.menuLoadFailure(
            ServerException(message: failure.message)),
        (menuList) => MenuState.menuLoadSuccess(menuList),
      ),
    );
  }
}
