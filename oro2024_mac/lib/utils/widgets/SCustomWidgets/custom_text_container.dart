import 'package:flutter/material.dart';

class CustomTextContainer extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final double? height;
  final EdgeInsets? padding;
  final Widget? child;

  const CustomTextContainer({super.key, required this.text, required this.backgroundColor, this.height, this.padding, this.child});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: padding != null ? const EdgeInsets.all(0) : const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
        ),
        child: Row(
          children: [
            Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            child ?? const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
