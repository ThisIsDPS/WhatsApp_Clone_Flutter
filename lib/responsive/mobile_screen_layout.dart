import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/features/chat/widgets/contacts_list.dart';
import 'package:whatsapp_clone_flutter/widgets/dynamic_floating_action.dart';
// import 'package:whatsapp_clone_flutter/utils/colors.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
          bottom: TabBar(
            indicatorWeight: 4,
            tabs: const [
              Tab(text: 'Chats'),
              Tab(text: 'Updates'),
              Tab(text: 'Calls'),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            ContactsList(),
            Center(
              child: Text('Updates Tab Content'),
            ),
            Center(
              child: Text('Calls Tab Content'),
            ),
          ],
        ),
        floatingActionButton: dynamicFloatingActionButton(_currentIndex, context),
      ),
    );
  }
}
