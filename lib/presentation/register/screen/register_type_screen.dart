import 'package:flutter/material.dart';
import 'package:kayem_akarak/presentation/register/screen/register_screen.dart';
import 'package:kayem_akarak/presentation/shared/button_widget.dart';

class RegisterTypeScreen extends StatelessWidget {
  RegisterTypeScreen({super.key});
  final List<ItemModel> items = [
    ItemModel("images/image1.png", "Lorem ipusum dolor sit amet, consetetur",
        "Owner's account", 0),
    ItemModel("images/image2.png", "Lorem ipusum dolor sit amet, consetetur",
        "Interested's account", 1),
    ItemModel("images/image3.png", "Lorem ipusum dolor sit amet, consetetur",
        "Bank Name", 2),
    ItemModel("images/image4.png", "Lorem ipusum dolor sit amet, consetetur",
        "Company Name", 3)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.blue[900]),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Column(children: items.map((e) => chooseItem(e)).toList()),
            const SizedBox(
              height: 50,
            ),
            DefaultButton(
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ));
                },
                text: "Register now"),
          ],
        ),
      ),
    );
  }

  Widget chooseItem(ItemModel item) => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 231, 231, 231)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    item.image,
                    width: 150,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Wrap(children: [
                          Text(
                            item.subTitle,
                            style: const TextStyle(
                                color: Color.fromARGB(148, 13, 72, 161)),
                          ),
                        ])
                      ],
                    ),
                  ),
                  Radio(
                    value: item.title,
                    groupValue: item.index,
                    onChanged: (val) {},
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class ItemModel {
  String title;
  String subTitle;
  String image;
  int index;
  ItemModel(this.image, this.subTitle, this.title, this.index);
}
