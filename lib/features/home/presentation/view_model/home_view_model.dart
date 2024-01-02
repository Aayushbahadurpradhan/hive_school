import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/config/router/app_route.dart';
import 'package:student_management_hive_api/features/home/presentation/state/home_state.dart';

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, HomeState>((ref) => HomeViewModel());

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel() : super(HomeState.initial());

  void changeIndex(int index) {
    state = state.copyWith(index: index);
  }

  void signOut(BuildContext context){
    Navigator.pushReplacementNamed(context, AppRoute.loginRoute);
  }
}
