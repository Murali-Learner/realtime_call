import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThreeDotAnimation extends StatefulWidget {
  @override
  State createState() => ThreeDotAnimationState();
}

class ThreeDotAnimationState extends State<ThreeDotAnimation>
    with TickerProviderStateMixin {
  Animation<int>? _characterCount;

  String get _currentString => ".....";

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _characterCount = StepTween(begin: 0, end: _currentString.length)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    // controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final textStyle = theme.textTheme.bodyLarge;
    return AnimatedBuilder(
      animation: _characterCount!,
      builder: (BuildContext context, Widget? child) {
        String text = _currentString.substring(0, _characterCount!.value);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Calling",
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(text, textAlign: TextAlign.left, style: textStyle),
          ],
        );
      },
    );
  }
}
//   onPressed: () async {
//           controller.reset();
//           setState(() {
//             _stringIndex = _stringIndex + 1;
//             _characterCount = StepTween(begin: 0, end: _currentString.length)
//                 .animate(
//                     CurvedAnimation(parent: controller, curve: Curves.easeIn));
//           });
//           await controller.forward();
//         },