import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recycle/features/screens/home/model/user_model.dart';
import 'package:recycle/features/screens/home/service/general_service.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IHomeService homeService;
  HomeCubit(this.homeService) : super(const HomeState());

  Future<void> initalComplate() async {
    await Future.wait([]);
  }

  Future<void> sendUserModelInfo(UserModel model) async {
    final response = await homeService.sendUserItemToService(model);
  }

  void changeLoading(bool val) {
    emit(state.copyWith(isLoading: !(state.isLoading ?? false)));
  }
}
