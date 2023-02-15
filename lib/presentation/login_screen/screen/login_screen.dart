import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kayem_akarak/data/network/requests.dart';
import 'package:kayem_akarak/presentation/home_screen/screen/home_screen.dart';
import 'package:kayem_akarak/presentation/login_screen/bloc/login_cubit.dart';
import 'package:kayem_akarak/presentation/login_screen/bloc/login_state.dart';
import 'package:kayem_akarak/presentation/register/screen/register_type_screen.dart';
import 'package:kayem_akarak/presentation/shared/text_field.dart';

import '../../shared/button_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/login.png",
                height: 250,
                width: double.infinity,
              ),
              DefaultTextField(
                  controller: userNameController,
                  hint: "Enter Your User Name",
                  text: "User name",
                  icon: const Icon(Icons.person)),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Password ",
                style: TextStyle(
                    color: Colors.blue[900], fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {},
                builder: (context, state) => TextFormField(
                  obscureText: BlocProvider.of<LoginCubit>(context).isVisible,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(87, 13, 72, 161)),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(87, 13, 72, 161)),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: "*************",
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(87, 13, 72, 161)),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton(
                            onPressed: () {
                              BlocProvider.of<LoginCubit>(context)
                                  .passwordvisible();
                            },
                            icon: Icon(
                                BlocProvider.of<LoginCubit>(context).suffix)),
                      ),
                      suffixIconColor: const Color.fromARGB(87, 13, 72, 161),
                      prefixIconColor: const Color.fromARGB(87, 13, 72, 161),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.lock),
                      )),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Forgot your password ?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "click here",
                      style: TextStyle(color: Colors.amber),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    if (state.access != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                    }
                  }
                },
                builder: (context, state) => Center(
                    child: state is LoginLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : DefaultButton(
                            function: () {
                              BlocProvider.of<LoginCubit>(context).login(
                                  model: LoginRequest(userNameController.text,
                                      passwordController.text));
                            },
                            text: "Login")),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterTypeScreen(),
                          ));
                    },
                    child: const Text(
                      "click here",
                      style: TextStyle(color: Colors.amber),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
