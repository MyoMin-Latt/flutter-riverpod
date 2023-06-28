import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_flutter_riverpod/change_notifier_page.dart';
import 'package:state_flutter_riverpod/future_provider_page.dart';
import 'package:state_flutter_riverpod/provider_page.dart';
import 'package:state_flutter_riverpod/provider_page2.dart';
import 'package:state_flutter_riverpod/scope_provider_page.dart';
import 'package:state_flutter_riverpod/state_notifier_page.dart';
import 'package:state_flutter_riverpod/state_provider_page.dart';

import 'future_stream_page.dart';
import 'stream_provider_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RiverPod'),
        ),
        body: ListView(
          children: const [
            ItemCard(title: "Provider", page: ProviderPage()),
            ItemCard(title: "Provider2", page: ProviderPage2()),
            ItemCard(title: "StateProvider", page: StateProviderPage()),
            ItemCard(title: "StateNotifier", page: StateNotifierPage()),
            ItemCard(title: "ChangeNotifier", page: ChangeNotifierPage()),
            ItemCard(title: "FutureProvider", page: FutureProviderPage()),
            ItemCard(title: "StreamProvider", page: StreamProviderPage()),
            ItemCard(title: "ScopeProvider", page: ScopeProviderPage()),
            ItemCard(title: "FutureStreamProvider", page: FutureStreamPage()),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Widget page;
  final String title;
  const ItemCard({
    super.key,
    required this.page,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        child: ListTile(
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => page,
          )),
        ),
      ),
    );
  }
}
