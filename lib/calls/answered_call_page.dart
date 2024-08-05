import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_call/providers/call_provider.dart';
import 'package:realtime_call/calls/widgets/profile_pic_widget.dart';
import 'package:realtime_call/extensions/context_extensions.dart';
import 'package:realtime_call/extensions/naming_extension.dart';
import 'package:realtime_call/extensions/spacer_extension.dart';

class AnsweredCallScreen extends StatefulWidget {
  const AnsweredCallScreen({
    super.key,
    this.profilePic = "",
    this.username = "",
  });
  final String profilePic;
  final String username;

  @override
  AnsweredCallScreenState createState() => AnsweredCallScreenState();
}

class AnsweredCallScreenState extends State<AnsweredCallScreen> {
  @override
  void initState() {
    super.initState();
    final callProvider = context.read<CallProvider>();
    callProvider.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final callProvider = context.read<CallProvider>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfilePicWidget(
                profilePic: widget.profilePic,
                username: widget.username,
                radius: 50,
              ),
              20.vSpace,
              Text(
                widget.username.toPascalCase(),
                style: context.textTheme.headlineMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Consumer<CallProvider>(
                builder: (context, provider, _) {
                  return Text(
                    provider.formattedDuration,
                    style: context.textTheme.headlineSmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  );
                },
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.mic_off, color: Colors.white),
                    iconSize: 30,
                    onPressed: () {
                      // Provider.toggleMute();
                    },
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      //  callProvider.endCall();
                      context.pop();
                      callProvider.stopTimer();
                    },
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.call_end, color: Colors.white),
                  ),
                  IconButton(
                    icon: const Icon(Icons.volume_up, color: Colors.white),
                    iconSize: 30,
                    onPressed: () {
                      //TODO: Speaker functionality
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
