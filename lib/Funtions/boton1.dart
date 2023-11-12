import 'package:flutter/material.dart';

class ShinyButton extends StatefulWidget {
  final Widget child;
  final color;
  final VoidCallback onTap;

  const ShinyButton(
      {super.key,
      required this.color,
      required this.onTap,
      required this.child});

  @override
  State<ShinyButton> createState() => _ShinyButtonState();
}

class _ShinyButtonState extends State<ShinyButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        child: widget.child,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              widget.color,
              widget.color,
            ],
          ),
        ),
      ),
    );
  }
}
