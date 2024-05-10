import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final numberStateProvider = StateProvider<int>((ref) {
  return 44;
});

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberState = ref.watch(numberStateProvider);
    final numberNotifier = ref.read(numberStateProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider: StateProvider'),
      ),
      body: Center(
        child: Text(
          numberState.toString(),
          style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () => numberNotifier.state++,
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => numberNotifier.state--,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  // void increment(WidgetRef ref) {
  //   ref.read(numberStateProvider.notifier).state++;
  // }
}
