import 'package:flutter/material.dart';

class WebFeatures extends StatelessWidget {
  const WebFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(child: Icon(Icons.book)),
              Text("data"),
              Text("data"),
        
            ],
          ),
        );
      },
    );
  }
}
