import 'package:flutter/material.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 3.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              hintText: "Enter a number",
              hintStyle: TextStyle(
                color: Colors
                    .black, // Set this to black to be visible on white background
              ),
            ),
            style: TextStyle(
              color: Colors.white, // Text color inside the field
            ),
          ),
        ],
      ),
    );
  }
}
