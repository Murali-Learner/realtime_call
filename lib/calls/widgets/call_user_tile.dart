import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_call/providers/auth_provider.dart';
import 'package:realtime_call/providers/call_provider.dart';
import 'package:realtime_call/calls/outgoing_call_page.dart';
import 'package:realtime_call/models/contact_model.dart';
import 'package:realtime_call/calls/widgets/contact_tile_pick_widget.dart';
import 'package:realtime_call/extensions/context_extensions.dart';

class CallUserTile extends StatelessWidget {
  const CallUserTile({
    super.key,
    required this.contact,
  });

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    final callProvider = context.read<CallProvider>();
    final authProvider = context.read<AuthProvider>();

    debugPrint("user map ${contact.uid}");
    return ListTileTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        tileColor: contact.joined ? Colors.red : Colors.amber,
        onTap: () {
          //  userChatProvider.setContact = contact;
          // context.push(navigateTo: const ChatScreen());
        },
        leading: ContactTilePicWidget(contact: contact),
        title: Text(
          contact.name,
          style: context.textTheme.titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            // CallEnum.incomingCall
            //     ? const Icon(Icons.call_received)
            //     :
            const Icon(
              Icons.arrow_outward_outlined,
              size: 25,
            ),
            Text(
              'UID:${contact.uid}',
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
        trailing: Consumer<AuthProvider>(builder: (context, provider, _) {
          return IconButton(
            onPressed: () {
              // debugPrint("statement ${contact.joined}");
              // authProvider.getCurrentUser();

              final updatedContact = contact.copyWith(
                joined: !contact.joined,
                whoIsCalling: provider.currentUser!.name,
              );
              authProvider.setContact(contact.uid);
              authProvider.updateUser();
              // context.push(
              //     navigateTo: OutgoingCallPage(
              //   username: contact.name,
              // ));
            },
            icon: const Icon(Icons.call),
          );
        }),
      ),
    );
  }
}
