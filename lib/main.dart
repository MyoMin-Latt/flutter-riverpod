import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'change_notifier_page.dart';
import 'future_stream_page.dart';
import 'provider_page.dart';
import 'provider_page2.dart';
import 'state_provider_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hook Riverpod'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return const ProviderPage();
              })),
              child: const Text('Provider Page'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return const ProviderPage2();
              })),
              child: const Text('Provider Page2'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return const StateProviderPage();
              })),
              child: const Text('State Provider Page'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return const StateProviderPage();
              })),
              child: const Text('State Notifier Provider Page'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return const ChangeNotifierPage();
              })),
              child: const Text('Change Notifier Provider Page'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return const FutureStreamPage();
              })),
              child: const Text('Future Stream Provider Page'),
            ),
          ],
        ),
      ),
    );
  }
}
