import 'package:flutter/material.dart';

enum BadgeSide { left, right }

class SideBadge extends StatelessWidget {
  const SideBadge({
    super.key,
    required this.text,
    required this.color,
    required this.side,
  });

  final String text;
  final Color color;
  final BadgeSide side;

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius =
        side == BadgeSide.right
            ? const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            )
            : const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            );

    final Border border =
        side == BadgeSide.right
            ? Border(
              top: BorderSide(color: color, width: 2),
              right: BorderSide(color: color, width: 2),
              bottom: BorderSide(color: color, width: 2),
              left: BorderSide.none,
            )
            : Border(
              top: BorderSide(color: color, width: 2),
              left: BorderSide(color: color, width: 2),
              bottom: BorderSide(color: color, width: 2),
              right: BorderSide.none,
            );

    final EdgeInsets padding =
        side == BadgeSide.right
            ? const EdgeInsets.only(right: 8)
            : const EdgeInsets.only(left: 8);

    return Container(
      constraints: const BoxConstraints(minWidth: 30),
      height: 30,
      decoration: BoxDecoration(borderRadius: radius, border: border),
      child: Center(
        child: Padding(
          padding: padding,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
