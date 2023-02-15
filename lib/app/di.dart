import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kayem_akarak/domain/use_cases/register_usecase.dart';
import 'package:kayem_akarak/presentation/login_screen/bloc/login_cubit.dart';
import 'package:kayem_akarak/presentation/register/bloc/register_cubit.dart';

import '../data/data_source/remote_data_source.dart';
import '../data/network/app_api.dart';
import '../data/network/dio_factory.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repository/repository.dart';
import '../domain/use_cases/login_usecase.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {
  //cubit
  instance.registerFactory<RegisterCubit>(
      () => RegisterCubit(registerUseCase: instance.call()));

  instance.registerFactory<LoginCubit>(
      () => LoginCubit(loginUseCase: instance.call()));
/*    app module, it's a module where we put all generic dependancies */
  /*  //shared preference instance
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  //app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance())); */
  //dio factory instance
  instance.registerFactory<DioFactory>(() => DioFactory());

  //app service client instance
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerFactory<AppServiceClient>(() => AppServiceClient(dio));

  // instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));

  //remote data source instance
  instance.registerFactory<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance.call()));

  //repository instance
  instance.registerFactory<Repository>(() => RepositoryImpl(instance.call()));

  //usecase
  instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance.call()));

  instance.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(instance.call()));
}
/* 
initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initForgotPasswordModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerFactory<ForgotPasswordUseCase>(
        () => ForgotPasswordUseCase(instance()));

    instance.registerFactory<ForgetPasswordViewModel>(
        () => ForgetPasswordViewModel(instance()));
  }
}

initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance
        .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));

    instance.registerFactory<RegisterViewModel>(
        () => RegisterViewModel(instance()));
    instance.registerFactory<ImagePicker>(() => ImagePicker());
  }
}

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));

    instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
  }
}

initStoreDetailsModule() {
  if (!GetIt.I.isRegistered<StoreDetailsUseCase>()) {
    instance.registerFactory<StoreDetailsUseCase>(
        () => StoreDetailsUseCase(instance()));

    instance.registerFactory<StoreDetailsViewModel>(
        () => StoreDetailsViewModel(instance()));
  }
}
 */