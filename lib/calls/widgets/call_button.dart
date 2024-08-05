import 'package:flutter/material.dart';
import 'package:realtime_call/calls/widgets/pulse_button.dart';
import 'package:realtime_call/extensions/context_extensions.dart';

class CallButton extends StatelessWidget {
  const CallButton({
    super.key,
    required this.icon,
    required this.iconName,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.black,
    required this.ontap,
  });
  final IconData icon;
  final String iconName;
  final GestureTapCallback ontap;
  final Color iconColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: PulseButton(
              iconcolor: iconColor,
              onTap: ontap,
              icon: icon,
              backgroundColor: backgroundColor,
              radius: 30,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              iconName,
              style: context.theme.textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
