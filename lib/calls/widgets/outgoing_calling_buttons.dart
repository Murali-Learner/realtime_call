import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_call/calls/widgets/call_button.dart';
import 'package:realtime_call/extensions/context_extensions.dart';
import 'package:realtime_call/models/contact_model.dart';
import 'package:realtime_call/providers/auth_provider.dart';

class OutGoingCallingButtons extends StatelessWidget {
  const OutGoingCallingButtons({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
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
              icon: Icons.volume_up_outlined,
              iconName: "Speaker",
              ontap: () {},
            ),
            CallButton(
              icon: Icons.call_end_outlined,
              iconName: "End Call",
              backgroundColor: Colors.red,
              ontap: () {
                final provider = context.read<AuthProvider>();
                provider.updateUser();
                context.pop();

                // GetProvider.callProvider.declineCall();
              },
            ),
          ],
        ),
      ),
    );
  }
}
