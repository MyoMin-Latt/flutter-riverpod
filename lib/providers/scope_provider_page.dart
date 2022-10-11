import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// not use
final futureProvider = FutureProvider(
  (ref) {
    return Future.value(123);
  },
);

final streamProvider = FutureProvider(
  (ref) {
    return Future.value(456);
  },
);

class ScopeProviderPage extends ConsumerWidget {
  const ScopeProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamNumber = ref.watch(streamProvider);
    final futureNumber = ref.watch(futureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider: Future & Stream Provider'),
      ),
      body: Column(
        children: [
          const Text('Future Number'),
          Center(
            child: futureNumber.when(
              data: (data) => Center(child: Text(data.toString())),
              error: (e, s) => const Center(child: Text('Error')),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text('Stream Number'),
          Center(
            child: streamNumber.when(
              data: (data) => Center(child: Text(data.toString())),
              error: (e, s) => const Center(child: Text('Error')),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
