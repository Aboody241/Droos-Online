
import 'package:droos_online/core/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';

class HeadLanding extends StatelessWidget {
  const HeadLanding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 234, 242, 251)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(children: [
            Text("data"),
            Text("data"),
            Text("data"),
            Row(
              children: [
              CustomButton1(backgroundColor: Colors.blueAccent, textColor: Colors.white, title: "Get Start",),
              CustomButton1(backgroundColor: Colors.white, textColor: Colors.blueAccent, title: "Learn More",)
              ],
            )
          ],)
        ,
        Image.asset("assets/landing/landing_image.png")
        ],
      ),
    );
  }
}