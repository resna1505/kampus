import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kampus/chat_provider.dart';
import 'package:kampus/ui/widgets/chat_tile.dart';
import 'package:provider/provider.dart';

class BuildChats extends StatefulWidget {
  const BuildChats({super.key});

  @override
  State<BuildChats> createState() => _BuildChatsState();
}

class _BuildChatsState extends State<BuildChats> {
  final _auth = FirebaseAuth.instance;

  User? loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    // try {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
    }
    // } catch (e) {
    //   print(e);
    // }
  }

  Future<Map<String, dynamic>> _fetchChatData(String chatId) async {
    final chatDoc =
        await FirebaseFirestore.instance.collection('chats').doc(chatId).get();
    final chatData = chatDoc.data();
    final users = chatData!['users'] as List<dynamic>?;
    final receiverId = users!.firstWhere((id) => id != loggedInUser!.uid);
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .get();
    final userData = userDoc.data()!;
    return {
      'chatId': chatId,
      'lastMessage': chatData['lastMessage'] ?? 'No messages yet',
      'timestamp': chatData['timestamp']?.toDate() ?? DateTime.now(),
      'userData': userData,
    };
  }

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    return WillPopScope(
      child: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: loggedInUser != null
                ? chatProvider.getChats(loggedInUser!.uid)
                : const Stream.empty(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final chatDocs = snapshot.data!.docs;

              return FutureBuilder<List<Map<String, dynamic>>>(
                future: Future.wait(
                  chatDocs.map(
                    (chatDoc) async {
                      final chatData = await _fetchChatData(chatDoc.id);
                      return chatData;
                    },
                  ),
                ),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final chatDataList = snapshot.data!;

                  return ListView.builder(
                    itemCount: chatDataList.length,
                    itemBuilder: (context, index) {
                      final chatData = chatDataList[index];

                      return ChatTile(
                        chatId: chatData['chatId'],
                        lastMessage: chatData['lastMessage'],
                        timestamp: chatData['timestamp'],
                        receiverData: chatData['userData'],
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
      onWillPop: () async => false,
    );
    // return Column(
    //   children: [
    //     Column(
    //       children: [
    //         Container(
    //           decoration: BoxDecoration(
    //             border: Border.all(
    //               color: greySoftColor,
    //               width: 1,
    //             ),
    //           ),
    //           padding: const EdgeInsets.symmetric(
    //             horizontal: 32,
    //             vertical: 15,
    //           ),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text(
    //                 'Chat',
    //                 style: blackTextStyle.copyWith(
    //                   fontSize: 16,
    //                   fontWeight: semiBold,
    //                 ),
    //               ),
    //               Icon(
    //                 Icons.chat_outlined,
    //                 color: purpleColor,
    //                 size: 18,
    //               ),
    //             ],
    //           ),
    //         ),
    //         Container(
    //           margin: const EdgeInsets.symmetric(
    //             horizontal: 24,
    //             vertical: 8,
    //           ),
    //           child: TextFormField(
    //             decoration: InputDecoration(
    //               hintText: 'Search chat',
    //               prefixIcon: const Icon(Icons.search),
    //               border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(14),
    //                 borderSide: BorderSide(
    //                   color: purpleColor,
    //                 ),
    //               ),
    //               contentPadding: const EdgeInsets.all(12),
    //             ),
    //           ),
    //         ),
    //       ],
    //     )
    //   ],
    // );
  }
}
