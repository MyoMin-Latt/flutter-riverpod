import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_flutter_riverpod/local_storage/flutter_secure_storage/flutter_secure_storage_page.dart';
import 'package:state_flutter_riverpod/local_storage/share_prefs/share_preference_page.dart';

import 'providers/change_notifier_page.dart';
import 'providers/future_stream_page.dart';
import 'providers/future_stream_page_version2.dart';
import 'providers/provider_page.dart';
import 'providers/provider_page2.dart';
import 'providers/state_notifier_page.dart';
import 'providers/state_provider_page.dart';

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
    double defaultHeigh = 5;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hook Riverpod'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            const Text(
              'Riverpod State',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 5),

            // Provider Page
            ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return const ProviderPage();
              })),
              child: const Text('Provider Page'),
            ),
            SizedBox(height: defaultHeigh),

            // Provider Page2 with consumer
            ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return const ProviderPage2();
              })),
              child: const Text('Provider Page2'),
            ),
            SizedBox(height: defaultHeigh),

            // State Provider Page
            ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return const StateProviderPage();
              })),
              child: const Text('State Provider Page'),
            ),
            SizedBox(height: defaultHeigh),

            // State Notifier Provider Page
            ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return const StateNotifierPage();
              })),
              child: const Text('State Notifier Provider Page'),
            ),
            SizedBox(height: defaultHeigh),

            // Change Notifier Provider Page
            ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return const ChangeNotifierPage();
              })),
              child: const Text('Change Notifier Provider Page'),
            ),
            SizedBox(height: defaultHeigh),

            // Future Stream Provider Page
            ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return const FutureStreamPage();
              })),
              child: const Text('Future Stream Provider Page'),
            ),
            SizedBox(height: defaultHeigh),

            // Future Stream Provider Page version2
            ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return const FutureStreamPageV2();
              })),
              child: const Text('Future Stream Provider Page V2'),
            ),
            const SizedBox(height: 20),

            // Storage
            const Text(
              'Storage',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: defaultHeigh),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SharePreferencePage();
                  },
                ),
              ),
              child: const Text('Share Perference'),
            ),
            SizedBox(height: defaultHeigh),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const FlutterSecureStoragePage();
                  },
                ),
              ),
              child: const Text('Flutter Secure Storage'),
            ),
          ],
        ),
      ),
    );
  }
}
