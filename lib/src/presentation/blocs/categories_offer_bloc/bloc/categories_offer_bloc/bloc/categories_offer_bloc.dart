import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:menu_loyalty/src/core/error/exception.dart';

import '../../../../../../data/models/categories_offer_model/categories_offer_model.dart';

part 'categories_offer_event.dart';
part 'categories_offer_state.dart';
part 'categories_offer_bloc.freezed.dart';

class CategoriesofferBloc
    extends Bloc<CategoriesofferEvent, CategoriesofferState> {
  CategoriesofferBloc() : super(_Initial()) {
    on<CategoriesofferEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
