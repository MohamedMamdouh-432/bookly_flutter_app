import 'package:flutter/material.dart';

class HalfPreviewButton extends StatelessWidget {
  final String content;
  final Color color;
  final TextStyle style;
  final Function()? onTap;

  const HalfPreviewButton({
    super.key,
    required this.content,
    required this.color,
    required this.style, 
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          color: color,
          child: Text(
            content,
            style: style,
          ),
        ),
      ),
    );
  }
}
