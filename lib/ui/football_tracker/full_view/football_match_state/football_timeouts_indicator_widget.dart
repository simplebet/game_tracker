import 'package:flutter/material.dart';

class FootballTimeoutsIndicators extends StatelessWidget {
  const FootballTimeoutsIndicators({
    required this.maxWidth,
    required this.timeoutsLeft,
    super.key,
  });

  final double maxWidth;
  final int timeoutsLeft;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: maxWidth * 0.12,
          height: 2,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(2),
            ),
          ),
        ),
        Container(
          width: 2,
          height: 2,
          color: timeoutsLeft <= 2 ? Colors.white : Colors.black,
        ),
        Container(
          width: maxWidth * 0.09,
          height: 2,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
        ),
        Container(
          width: 2,
          height: 2,
          color: timeoutsLeft <= 1 ? Colors.white : Colors.black,
        ),
        Container(
          width: maxWidth * 0.12,
          height: 2,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(2),
            ),
          ),
        ),
      ],
    );
  }
}
