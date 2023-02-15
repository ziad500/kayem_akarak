import 'package:flutter/material.dart';
import 'package:kayem_akarak/presentation/register/screen/register_screen2.dart';
import 'package:kayem_akarak/presentation/shared/button_widget.dart';
import 'package:kayem_akarak/presentation/shared/text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController nationalIDController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
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
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "images/image1.png",
                  height: 180,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 10,
                ),
                DefaultTextField(
                    controller: fullNameController,
                    hint: "Enter your name..",
                    text: "Full name",
                    icon: const Icon(
                      Icons.person,
                    )),
                const SizedBox(
                  height: 10,
                ),
                DefaultTextField(
                    controller: nationalIDController,
                    hint: "Enter your ID number..",
                    text: "National ID number",
                    icon: const Icon(
                      Icons.add_card_sharp,
                    )),
                const SizedBox(
                  height: 10,
                ),
                DefaultTextField(
                    controller: emailController,
                    hint: "Enter your email..",
                    text: "Email",
                    icon: const Icon(
                      Icons.person,
                    )),
                const SizedBox(
                  height: 10,
                ),
                DefaultTextField(
                    controller: phoneNumberController,
                    hint: "Enter your phone number..",
                    text: "Phone number",
                    icon: const Icon(
                      Icons.person,
                    )),
                const SizedBox(
                  height: 20,
                ),
                DefaultButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Register2Screen(
                                  email: emailController.text,
                                  fullName: fullNameController.text,
                                  nationalID: nationalIDController.text,
                                  phone: phoneNumberController.text),
                            ));
                      }
                    },
                    text: "Next",
                    icon: Icons.arrow_forward)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
