import 'package:flutter/material.dart';
import 'package:realtime_call/calls/widgets/mute_button.dart';
import 'package:realtime_call/calls/widgets/outgoing_calling_buttons.dart';
import 'package:realtime_call/extensions/context_extensions.dart';
import 'package:realtime_call/models/contact_model.dart';
import 'widgets/call_profile_widget.dart';

class OutgoingCallPage extends StatelessWidget {
  const OutgoingCallPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text(
          'Outgoing call',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Expanded(
          //   flex: 6,
          //   child: CallProfileWidget(
          //     profilePic: profilePic,
          //     username: username,
          //   ),
          // ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                const MuteButton(),
                const Spacer(),
                OutGoingCallingButtons(),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
