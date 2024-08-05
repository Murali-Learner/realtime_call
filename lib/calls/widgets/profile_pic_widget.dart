import 'package:flutter/material.dart';
import 'package:realtime_call/extensions/context_extensions.dart';

class ProfilePicWidget extends StatelessWidget {
  const ProfilePicWidget({
    super.key,
    this.profilePic = "",
    this.username = "",
    this.radius,
  });
  final String profilePic;
  final String username;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return profilePic.isNotEmpty
        ? CircleAvatar(
            radius: radius,
            backgroundImage: NetworkImage(profilePic),
          )
        : CircleAvatar(
            radius: radius,
            backgroundColor: Theme.of(context).primaryColor,
            child: Text(
              username[0].toUpperCase(),
              style: context.textTheme.headlineLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          );
  }
}
