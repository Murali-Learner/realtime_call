import 'package:flutter/material.dart';

class PulseButton extends StatefulWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconcolor;
  final double radius;
  final GestureTapCallback onTap;

  const PulseButton(
      {super.key,
      required this.icon,
      required this.backgroundColor,
      required this.iconcolor,
      this.radius = 20,
      required this.onTap});

  @override
  PulseButtonState createState() => PulseButtonState();
}

class PulseButtonState extends State<PulseButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    _animation = Tween(begin: 0.0, end: 5.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return InkWell(
          onTap: widget.onTap,
          child: CircleAvatar(
            backgroundColor: widget.backgroundColor.withOpacity(0.5),
            radius: widget.radius + _animation.value,
            child: Icon(
              widget.icon,
              color: widget.iconcolor,
            ),
          ),
        );
        // return Container(
        //   width: 100 + _animation.value,
        //   height: 100 + _animation.value,
        //   decoration: BoxDecoration(
        //     shape: BoxShape.circle,
        //     color: widget.color.withOpacity(0.5),
        //   ),
        // );
      },
    );
  }
}
