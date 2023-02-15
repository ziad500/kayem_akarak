import 'package:dartz/dartz.dart';
import 'package:kayem_akarak/domain/model/models.dart';

import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../repository/repository.dart';

class LoginUseCase {
  final Repository _repository;
  LoginUseCase(
    this._repository,
  );

  Future<Either<Failure, AuthanticationModel>> execude(
      LoginRequest input) async {
    return await _repository
        .login(LoginRequest(input.username, input.password));
  }
}
