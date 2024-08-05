import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_call/models/contact_model.dart';
import 'package:realtime_call/providers/auth_provider.dart';
import 'package:realtime_call/providers/call_provider.dart';
import 'package:realtime_call/calls/widgets/call_button.dart';
import 'package:realtime_call/extensions/context_extensions.dart';

class IncomingCallingButtons extends StatelessWidget {
  const IncomingCallingButtons({
    super.key,
    required this.contact,
  });

  final Contact contact;
  @override
  Widget build(BuildContext context) {
    final callProvider = context.read<CallProvider>();
    final authProvider = context.read<AuthProvider>();

    return Expanded(
      flex: 3,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CallButton(
              icon: Icons.call_end_outlined,
              iconName: "End Call",
              backgroundColor: Colors.red,
              ontap: () {
                authProvider.setContact(contact.uid);
                authProvider.updateUser();
                // callProvider.declineCall();
                context.pop();
              },
            ),
            CallButton(
              icon: Icons.call,
              iconName: "Answer Call",
              backgroundColor: context.theme.primaryColor,
              ontap: () {
                // CallModel? callModel = callProvider.currentCall;
                // // log("answering call data  callModel?.receiverProfilePic- ${callModel?.receiverProfilePic} callModel?.receiverUserName ${callModel?.receiverUserName} ");
                // GetProvider.callProvider.answerCall();
                // context.pushReplacement(
                //     navigateTo: AnsweredCallScreen(
                //   profilePic: callModel?.callerProfilePic ?? "",
                //   username: callModel?.callerUserName ?? "",
                // ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
