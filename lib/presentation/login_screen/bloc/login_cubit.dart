import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kayem_akarak/data/network/requests.dart';
import 'package:kayem_akarak/domain/use_cases/login_usecase.dart';
import 'package:kayem_akarak/presentation/login_screen/bloc/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginInitial());

  bool isVisible = true;
  IconData suffix = Icons.visibility_outlined;

  void passwordvisible() {
    isVisible = !isVisible;
    suffix =
        isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisiblilityState());
  }

  Future<void> login({required LoginRequest model}) async {
    emit(LoginLoading());
    await loginUseCase.execude(model).then((value) => value.fold((l) {
          emit(LoginError());
        }, (r) {
          emit(LoginSuccess(access: r.access));
        }));
  }
}
