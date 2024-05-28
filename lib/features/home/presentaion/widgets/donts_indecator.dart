import 'package:fasn_ecommerce/features/home/presentaion/widgets/custom_dot_indecator.dart';
import 'package:flutter/material.dart';

class DotsIndecator extends StatelessWidget {
  const DotsIndecator(
      {super.key, required this.currentIndex, required this.dotNumber});
  final int currentIndex;
  final int dotNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(dotNumber, (index) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(start: 5),
          child: CustomDotIndecator(
            isActive: index == currentIndex,
          ),
        );
      }),
    );
  }
}
