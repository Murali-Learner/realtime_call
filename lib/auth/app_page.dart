import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_call/auth/login_page.dart';
import 'package:realtime_call/calls/calls_page.dart';
import 'package:realtime_call/calls/outgoing_call_page.dart';
import 'package:realtime_call/providers/auth_provider.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, _) {
      if (provider.authUser == null) {
        return LoginPage();
      } else if (provider.authLoader) {
        return const Center(child: CircularProgressIndicator.adaptive());
      } else {
        if (provider.authUser == null || provider.currentUser == null) {
          return LoginPage();
        } else if (provider.currentUser!.joined) {
          return OutgoingCallPage();
        } else {
          return const CallsPage();
        }
      }
    });
  }
}
