import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_call/providers/call_provider.dart';
import 'package:realtime_call/extensions/spacer_extension.dart';

class CallChatUserSheet extends StatefulWidget {
  const CallChatUserSheet({super.key});

  @override
  CallChatUserSheetState createState() => CallChatUserSheetState();
}

class CallChatUserSheetState extends State<CallChatUserSheet> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
    searchController.addListener(_onSearchChanged);
  }

  init() async {
    // await GetProvider.requestsProvider.fetchAllUsers();
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    // final requestsProvider = GetProvider.requestsProvider;
  }

  @override
  Widget build(BuildContext context) {
    final callProvider = context.read<CallProvider>();

    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Column(
        children: [
          10.vSpace,
          const Text(
            'Call Users',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          10.vSpace,
          // TODO: add this in feature
          // Padding(
          //   padding: const EdgeInsets.all(5.0),
          //   child: TextField(
          //     controller: searchController,
          //     decoration: InputDecoration(
          //       labelText: 'Search Users',
          //       prefixIcon: const Icon(Icons.search),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(15.0),
          //       ),
          //     ),
          //   ),
          // ),
          // Expanded(
          //   child: Consumer<HomeChatProvider>(
          //     builder: (context, provider, child) {
          //       return ListView.separated(
          //         itemCount: provider.chatUsers.length,
          //         padding:
          //             const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //         separatorBuilder: (context, index) => 10.vSpace,
          //         itemBuilder: (context, index) {
          //           final int key = provider.chatUsers.keys.elementAt(index);
          //           final Contact user = provider.chatUsers[key]!;
          //           return InviteUserTile(
          //             contact: user,
          //             isChatUser: false,
          //           );
          //         },
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
