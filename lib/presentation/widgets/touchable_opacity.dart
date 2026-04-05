import 'package:flutter/material.dart';

class TouchableOpacity extends StatefulWidget {
  const TouchableOpacity({
    super.key,
    required this.onTap,
    required this.child,
    this.activeOpacity = 0.5,
    this.duration = const Duration(milliseconds: 100),
  });

  final VoidCallback onTap;
  final Widget child;
  final double activeOpacity;
  final Duration duration;

  @override
  State<TouchableOpacity> createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedOpacity(
        duration: widget.duration,
        opacity: _isPressed ? widget.activeOpacity : 1.0,
        child: widget.child,
      ),
    );
  }
}
