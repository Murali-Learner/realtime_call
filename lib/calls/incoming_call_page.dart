import 'package:flutter/material.dart';
import 'package:realtime_call/extensions/context_extensions.dart';

import 'widgets/call_profile_widget.dart';

class IncomingCallPage extends StatelessWidget {
  const IncomingCallPage({
    super.key,
    this.profilePic = "",
    this.username = "",
  });
  final String profilePic;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.secondary,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          'Incoming call',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: CallProfileWidget(
              profilePic: profilePic,
              username: username,
            ),
          ),
          const Spacer(),
          // const Expanded(
          //   flex: 3,
          //   child: IncomingCallingButtons(),
          // ),
          const Spacer(),
        ],
      ),
    );
  }
}
