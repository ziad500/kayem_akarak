import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {super.key,
      this.icon,
      required this.function,
      required this.text,
      this.color = const Color.fromARGB(255, 0, 49, 123)});
  final double width = double.infinity;
  final double height = 55;
  final bool isUpperCase = true;
  final double radius = 50.0;
  final IconData? icon;
  final Color? textColor = Colors.white;
  final Function()? function;
  final String text;
  final Color color;
  final double verticalpadding = 14.0;
  final double textsize = 14.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(
            radius,
          ),
          color: color,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 6,
              offset: Offset(0, 4),
            )
          ]),
      child: MaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        padding: EdgeInsets.symmetric(vertical: verticalpadding, horizontal: 5),
        onPressed: function,
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      isUpperCase ? text.toUpperCase() : text,
                      style: TextStyle(
                          color: textColor,
                          fontSize: textsize,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 15,
                  ),
                ],
              )
            : FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  isUpperCase ? text.toUpperCase() : text,
                  style: TextStyle(
                      color: textColor,
                      fontSize: textsize,
                      fontWeight: FontWeight.bold),
                ),
              ),
      ),
    );
  }
}
