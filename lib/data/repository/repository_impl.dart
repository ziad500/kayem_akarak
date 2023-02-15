// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:kayem_akarak/data/mapper/mapper.dart';
import 'package:kayem_akarak/data/response/responses.dart';
import 'package:dartz/dartz.dart';
import 'package:kayem_akarak/domain/model/models.dart';

import '../../domain/repository/repository.dart';
import '../data_source/remote_data_source.dart';
import '../network/failure.dart';
import '../network/requests.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;

  RepositoryImpl(
    this._remoteDataSource,
  );

  @override
  Future<Either<Failure, AuthanticationModel>> login(
      LoginRequest loginRequest) async {
    try {
      final response = await _remoteDataSource.login(loginRequest);

      return right(response.toDomain());
      // print(response.access);
    } catch (error) {
      //use error handler
      return left(Failure(404, "error"));
    }
  }

  RegisterResponse? registerModel;

  @override
  Future register(RegisterRequest registerRequest) async {
    try {
      final response = await _remoteDataSource.register(registerRequest);
      RegisterResponse.fromJson(response.toJson());
      registerModel = RegisterResponse.fromJson(response.toJson());

      if (response.name != null) {
        //  print(response.name);
        //success
        return response;
      } else {
        //failure
        //  print("error $response");
        return response;
      }
    } catch (error) {
      //use error handler
      // print("erorrrrr $error");
    }
  }
}
