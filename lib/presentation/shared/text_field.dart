import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField(
      {super.key,
      required this.hint,
      required this.text,
      required this.icon,
      required this.controller});
  final String hint;
  final String text;
  final Icon icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style:
              TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return "enter your $text please ";
            }
            return null;
          },
          decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(30.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(87, 13, 72, 161)),
                borderRadius: BorderRadius.circular(30.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(87, 13, 72, 161)),
                borderRadius: BorderRadius.circular(30.0),
              ),
              hintText: hint,
              hintStyle:
                  const TextStyle(color: Color.fromARGB(87, 13, 72, 161)),
              prefixIconColor: const Color.fromARGB(87, 13, 72, 161),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: icon,
              )),
        ),
      ],
    );
  }
}
