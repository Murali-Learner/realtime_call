import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_call/calls/outgoing_call_page.dart';
import 'package:realtime_call/calls/widgets/call_user_tile.dart';
import 'package:realtime_call/models/contact_model.dart';
import 'package:realtime_call/extensions/spacer_extension.dart';
import 'package:realtime_call/providers/auth_provider.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({super.key});

  @override
  CallsPageState createState() => CallsPageState();
}

class CallsPageState extends State<CallsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final provider = context.read<AuthProvider>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Consumer<AuthProvider>(builder: (context, provider, _) {
          return Text(provider.currentUser!.name);
        }),
      ),
      body: Consumer<AuthProvider>(builder: (context, provider, _) {
        debugPrint("current user ${provider.currentUser!.toJson()}");
        return Column(
          children: [
            10.vSpace,
            StreamBuilder<Map<String, Contact>>(
                stream: provider.getUsers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No users found '));
                  }
                  final usersMap = snapshot.data!;
                  final users = usersMap.values.toList();

                  return Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      separatorBuilder: (context, index) => 10.vSpace,
                      itemCount: usersMap.length,
                      itemBuilder: (context, index) {
                        return CallUserTile(
                          contact: users[index],
                        );
                      },
                    ),
                  );
                }),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () async {
          await context.read<AuthProvider>().signOut();
          // _showCallChatUserSheet(context);
        },
        child: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
      ),
    );
  }
}
