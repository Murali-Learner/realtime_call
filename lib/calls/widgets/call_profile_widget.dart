import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:realtime_call/calls/widgets/profile_pic_widget.dart';
import 'package:realtime_call/calls/widgets/three_dot_animation.dart';
import 'package:realtime_call/extensions/context_extensions.dart';
import 'package:realtime_call/extensions/naming_extension.dart';

class CallProfileWidget extends StatelessWidget {
  const CallProfileWidget(
      {super.key, this.profilePic = "", this.username = ""});
  final String profilePic;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ProfilePicWidget(
                  profilePic: profilePic,
                  username: username,
                  radius: 50,
                ),
              ),
              Text(
                username.toPascalCase(),
                style: context.textTheme.headlineMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              ThreeDotAnimation(),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
