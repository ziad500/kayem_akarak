import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kayem_akarak/data/network/requests.dart';
import 'package:kayem_akarak/presentation/login_screen/screen/login_screen.dart';
import 'package:kayem_akarak/presentation/register/bloc/register_cubit.dart';
import 'package:kayem_akarak/presentation/register/bloc/register_state.dart';
import 'package:kayem_akarak/presentation/shared/button_widget.dart';
import 'package:kayem_akarak/presentation/shared/text_field.dart';

class Register2Screen extends StatelessWidget {
  Register2Screen(
      {super.key,
      required this.fullName,
      required this.nationalID,
      required this.email,
      required this.phone});
  final String fullName;
  final String nationalID;
  final String email;
  final String phone;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController neighborhoodController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController detailedAddressController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.blue[900]),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: DefaultTextField(
                          controller: userNameController,
                          hint: "Enter your user name",
                          text: "User name",
                          icon: const Icon(
                            Icons.person,
                          )),
                    ),
                    Expanded(
                        child: IconButton(
                            onPressed: () {
                              BlocProvider.of<RegisterCubit>(context)
                                  .getProfileImage(
                                ImageSource.gallery,
                              );
                            },
                            icon: const Icon(Icons.add_a_photo)))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                DefaultTextField(
                    controller: passwordController,
                    hint: "Enter your password",
                    text: "Password",
                    icon: const Icon(
                      Icons.add_card_sharp,
                    )),
                const SizedBox(
                  height: 10,
                ),
                DefaultTextField(
                    controller: countryController,
                    hint: "Enter your country..",
                    text: "Country",
                    icon: const Icon(
                      Icons.map,
                    )),
                const SizedBox(
                  height: 10,
                ),
                DefaultTextField(
                    controller: neighborhoodController,
                    hint: "Select your neighborhood",
                    text: "Neighborhood",
                    icon: const Icon(
                      Icons.send,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DefaultTextField(
                          controller: cityController,
                          hint: "City",
                          text: "City",
                          icon: const Icon(
                            Icons.person,
                          )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: DefaultTextField(
                          controller: regionController,
                          hint: "Region",
                          text: "Region",
                          icon: const Icon(
                            Icons.person,
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                DefaultTextField(
                    controller: detailedAddressController,
                    hint: "Enter your detailed address",
                    text: "Detailed address",
                    icon: const Icon(
                      Icons.location_on,
                    )),
                const SizedBox(
                  height: 20,
                ),
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterSuccess) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    }
                  },
                  builder: (context, state) => DefaultButton(
                      function: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<RegisterCubit>(context).register(
                              model: RegisterRequest(
                                  name: fullName,
                                  username: userNameController.text,
                                  email: email,
                                  phone_1: phone,
                                  phone_2: phone,
                                  gender: "1",
                                  password: passwordController.text,
                                  password_2: passwordController.text,
                                  identification_type: "type",
                                  identification_number: "1020125688",
                                  identification_image:
                                      BlocProvider.of<RegisterCubit>(context)
                                          .profileImage!,
                                  user_type: "1",
                                  sign: BlocProvider.of<RegisterCubit>(context)
                                      .profileImage!,
                                  personal_image:
                                      BlocProvider.of<RegisterCubit>(context)
                                          .profileImage!,
                                  country: countryController.text));
                        }
                      },
                      text: "Finish",
                      icon: Icons.arrow_forward),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
