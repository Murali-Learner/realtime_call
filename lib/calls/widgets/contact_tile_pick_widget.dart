import 'package:flutter/material.dart';
import 'package:realtime_call/models/contact_model.dart';
import 'package:realtime_call/extensions/context_extensions.dart';

class ContactTilePicWidget extends StatelessWidget {
  const ContactTilePicWidget({
    super.key,
    required this.contact,
  });

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // context.push(navigateTo: ContactProfilePage(contact: contact));
      },
      child:
          //  contact.profilePic != null && contact.profilePic!.isNotEmpty
          // ? CircleAvatar(
          //     radius: 25,
          //     backgroundImage: NetworkImage(
          //       contact.profilePic!,
          //       // 'https://images.unsplash.com/photo-1715645971181-c7479b08604b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          //       scale: 1.5,
          //     ),
          //   )
          // :
          CircleAvatar(
        radius: 25,
        backgroundColor: context.theme.primaryColor,
        child: Text(
          contact.name[0].toUpperCase(),
          textAlign: TextAlign.center,
          style: context.textTheme.titleMedium,
        ),
      ),
    );
  }
}
