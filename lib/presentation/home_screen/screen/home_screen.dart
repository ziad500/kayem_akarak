import 'package:flutter/material.dart';
import 'package:kayem_akarak/presentation/shared/button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: body(context),
    );
  }

  Widget body(context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
          child: Column(
            children: [
              requestContainer(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customContainer("6", "Pending", Colors.amber),
                  const SizedBox(
                    width: 30,
                  ),
                  customContainer(
                      "25", "Done", const Color.fromARGB(87, 13, 72, 161)),
                  const SizedBox(
                    width: 30,
                  ),
                  customContainer("1", "Rejected", Colors.red)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) => listItem(),
              )
            ],
          ),
        ),
      );

  PreferredSizeWidget appbar() => PreferredSize(
        preferredSize: const Size.fromHeight(200.0),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(48.0),
            ),
          ),
          backgroundColor: Colors.transparent,
          flexibleSpace: Stack(
            children: [
              Container(
                height: 300,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(48),
                        bottomRight: Radius.circular(48)),
                    image: DecorationImage(
                        image: AssetImage("images/back.jpeg"),
                        fit: BoxFit.fill)),
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(48),
                      bottomRight: Radius.circular(48)),
                ),
                child: const Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "QAYEM AQARAK",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget customContainer(String number, String title, Color color) => Container(
        height: 100,
        width: 80,
        decoration: BoxDecoration(
            //color: Colors.red,
            border: Border.all(color: color, width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: color),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: color),
                ),
              ),
            )
          ],
        ),
      );

  Widget listItem() => Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            width: double.infinity,
            height: 88,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 243, 243, 243)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: const DecorationImage(
                            image: AssetImage("images/back.jpeg"))),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Evaluation purpose",
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.location_on,
                              size: 15,
                              color: Color.fromARGB(148, 13, 72, 161),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Expanded(
                              child: Text(
                                "47 3omaret ay haga next to fathalah, alexandria,smoha.",
                                style: TextStyle(
                                    color: Color.fromARGB(148, 13, 72, 161)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: const EdgeInsets.all(2.5),
              width: 70,
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber.withOpacity(0.5)),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Pending",
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                ),
              ),
            ),
          )
        ],
      );

  Widget requestContainer(context) => Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(194, 219, 219, 219)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add Request",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 49, 123)),
                  ),
                  SizedBox(
                    width: 300,
                    child: Wrap(
                      children: const [
                        Text(
                          "Lorem ipusum dolor sit amet,consetetur Lorem ipusum dolor sit amet, consetetur",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(147, 0, 49, 123)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                bottom: 130, start: MediaQuery.of(context).size.width - 170),
            child: Image.asset(
              "images/home.png",
              width: 100,
              height: 100,
            ),
          ),
          Padding(
            padding:
                const EdgeInsetsDirectional.only(top: 140, start: 35, end: 35),
            child: DefaultButton(
              color: const Color.fromARGB(255, 239, 180, 0),
              function: () {},
              text: "REQUEST NOW",
            ),
          )
        ],
      );
}
