import 'package:kayem_akarak/data/response/responses.dart';
import 'package:kayem_akarak/domain/model/models.dart';

extension RegisterResponseMapper on RegisterResponse? {
  RegisterModel toDomain() {
    return RegisterModel(
        name: this!.name ?? "",
        username: this!.username ?? "",
        email: this!.email ?? "",
        phone_1: this!.phone_1 ?? "",
        phone_2: this!.phone_2 ?? "",
        gender: this!.gender ?? "",
        identification_type: this!.identification_type ?? "",
        identification_number: this!.identification_number ?? "",
        identification_image: this!.identification_image ?? "",
        user_type: this!.user_type ?? "",
        sign: this!.sign ?? "",
        personal_image: this!.personal_image ?? "",
        country: this!.country ?? "");
  }
}

extension LoginResponseMapper on AuthenticationResponse? {
  AuthanticationModel toDomain() {
    return AuthanticationModel(
        access: this!.access ?? "", refresh: this!.refresh ?? "");
  }
}
