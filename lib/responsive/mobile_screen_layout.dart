import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_flutter/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_clone_flutter/features/chat/widgets/contacts_list.dart';
import 'package:whatsapp_clone_flutter/features/group/screens/create_group_screen.dart';
import 'package:whatsapp_clone_flutter/features/status/screens/status_contacts_screen.dart';
import 'package:whatsapp_clone_flutter/widgets/dynamic_floating_action.dart';
// import 'package:whatsapp_clone_flutter/utils/colors.dart';

class MobileScreenLayout extends ConsumerStatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  ConsumerState<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends ConsumerState<MobileScreenLayout>
    with WidgetsBindingObserver {
  int _currentIndex = 0;
  // late TabController tabBarController;

  @override
  void initState() {
    super.initState();
    // tabBarController = TabController(length: 3, vsync: this);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        ref.read(authControllerProvider).setUserState(true);
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.paused:
        ref.read(authControllerProvider).setUserState(false);
        break;
      default:
        break;
    }
  }

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
            PopupMenuButton(
              icon: const Icon(
                Icons.more_vert,
                color: Color.fromARGB(255, 248, 245, 245),
                size: 25,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  labelTextStyle: const MaterialStatePropertyAll(TextStyle(
                    color: Colors.black,
                  )),
                  child: const Text(
                    'Create Group',
                  ),
                  onTap: () => Future(
                    () => Navigator.pushNamed(
                        context, CreateGroupScreen.routeName),
                  ),
                )
              ],
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
            StatusContactsScreen(),
            Center(
              child: Text('Calls Tab Content'),
            ),
          ],
        ),
        floatingActionButton:
            dynamicFloatingActionButton(_currentIndex, context),
      ),
    );
  }
}
