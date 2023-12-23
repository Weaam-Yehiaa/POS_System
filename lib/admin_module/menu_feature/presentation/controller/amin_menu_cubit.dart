import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:side_proj/admin_module/menu_feature/domain/use_cases/add_item_use_case.dart';
import 'package:side_proj/admin_module/menu_feature/presentation/controller/amin_menu_states.dart';
import 'package:side_proj/shared/enums.dart';

import '../../domain/use_cases/fetch_menu_use_case.dart';

class AdminMenuCubit extends Cubit<AdminMenuState> {
  final AddIMenuItemUseCase _addIMenuItemUseCase;
  final FetchMenuUseCase _fetchMenuUseCase;

  AdminMenuCubit(this._addIMenuItemUseCase, this._fetchMenuUseCase) : super(const AdminMenuState());

  static AdminMenuCubit get(context) => BlocProvider.of(context);

  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController categoryItemController = TextEditingController();
  final TextEditingController categoryPriceController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void addItemMenu({
    required String categoryId,
    required String itemName,
    required int itemPrice,
  }) async {
    // if (await NetworkService().isConnected) {
    emit(state.copyWith(
      addItemState: RequestState.loading,
    ));
    final result = await _addIMenuItemUseCase({
      'categoryId': categoryId,
      'itemName': itemName,
      'itemPrice': itemPrice,
    });
    result.fold((l) {
      Fluttertoast.showToast(
          msg: l.errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }, (r) {
      categoryItemController.text = '';
      categoryPriceController.clear();
      emit(state.copyWith(addItemState: RequestState.loaded));
    });
    // } else {
    //   emit(state.copyWith(internetState: InternetState.disconnect));
    // }
  }

  void fetchMenu()async{
    emit(state.copyWith(
      fetchMenuState: RequestState.loading,
    ));

    final result=await _fetchMenuUseCase();
    result.fold((l) {
      Fluttertoast.showToast(
          msg: l.errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }, (r) {

      emit(state.copyWith(fetchMenuState: RequestState.loaded));
    });
  }
  void clearControllers() {
    categoryNameController.text = '';
    categoryItemController.text = '';
    categoryPriceController.clear();
  }
}
