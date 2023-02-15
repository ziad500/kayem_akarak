import '../../data/network/requests.dart';
import '../repository/repository.dart';

class RegisterUseCase {
  final Repository _repository;
  RegisterUseCase(
    this._repository,
  );

  Future execude(RegisterRequest input) async {
    return await _repository.register(input);
  }
}/* 
RegisterRequest(
        name: "name",
        username: "usessdrname",
        email: "aesmassisl@gmail.com",
        phone_1: "01220513291",
        phone_2: "012250133291",
        gender: "1",
        password: "password",
        password_2: "password",
        identification_type: "identification_type",
        identification_number: "1000000000",
        identification_image: file!,
        user_type: "0",
        sign: file,
        personal_image: file,
        country: "country") */