import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handling_error/core/models/hotel_model.dart';
import 'package:handling_error/core/models/login_model.dart';
import 'package:handling_error/core/models/profile_model.dart';
import 'package:handling_error/core/util/bloc/states.dart';
import 'package:handling_error/core/util/database/repository.dart';

class AppBloc extends Cubit<AppStates> {
  final Repository repository;

  AppBloc({
    required this.repository,
  }) : super(AppInitialState());

  static AppBloc get(context) => BlocProvider.of<AppBloc>(context);

  LoginModel? loginModel;

  void userLogin() async {
    emit(UserLoginLoadingState());

    final response = await repository.login(
      email: 'abdullah.mansour88@gmail.com',
      password: '123456',
    );

    response.fold(
          (l) {
        emit(ErrorState(exception: l));
      },
          (r) {
        loginModel = r;

        emit(UserLoginSuccessState());
      },
    );
  }

  ProfileModel? profileModel;

  void userProfile() async {
    emit(UserProfileLoadingState());

    final response = await repository.getProfile(
      token: loginModel!.data!.token,
    );

    response.fold(
          (l) {
        emit(ErrorState(exception: l));
      },
          (r) {
        profileModel = r;

        emit(UserProfileSuccessState());
      },
    );
  }

  List<HotelModel> hotels = [];

  void getHotels() async {
    emit(HotelsLoadingState());

    final response = await repository.getHotels(
      page: 1,
    );

    response.fold(
          (l) {
        emit(ErrorState(exception: l));
      },
          (r) {
        hotels = r.data!.data;

        emit(HotelsSuccessState());
      },
    );
  }
}