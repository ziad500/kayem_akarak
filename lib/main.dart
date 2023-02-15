import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kayem_akarak/presentation/login_screen/bloc/login_cubit.dart';
import 'package:kayem_akarak/presentation/login_screen/screen/login_screen.dart';
import 'package:kayem_akarak/presentation/register/bloc/register_cubit.dart';

import 'app/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initAppModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => di.instance<RegisterCubit>(),
          ),
          BlocProvider(
            create: (context) => di.instance<LoginCubit>(),
          )
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: LoginScreen()));
  }
}
