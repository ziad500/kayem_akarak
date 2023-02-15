import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kayem_akarak/data/network/requests.dart';
import 'package:kayem_akarak/domain/use_cases/register_usecase.dart';
import 'package:kayem_akarak/presentation/register/bloc/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit({required this.registerUseCase}) : super(RegisterInitial());

  Future<void> register({required RegisterRequest model}) async {
    try {
      await registerUseCase.execude(model);
      emit(RegisterSuccess());
    } on SocketException catch (_) {
      emit(RegisterError());
    } catch (_) {
      emit(RegisterError());
    }
  }

  File? profileImage;
  final ImagePicker picker = ImagePicker();

  Future getProfileImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image == null) {
      return;
    }
    profileImage = File(image.path);
    emit(UploadImageSuccess());
  }
}
