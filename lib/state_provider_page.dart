import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final numberProvider = Provider<int>((ref) {
  return 42;
});

final numberStateProvider = StateProvider<int>((ref) {
  return 44;
});

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final number = ref.watch(numberProvider);
    final numberState = ref.watch(numberStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider: StateProvider'),
      ),
      body: Center(
        child: Text(numberState.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Colors.green,
        onPressed: () => increment(ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  void increment(WidgetRef ref) {
    ref.read(numberStateProvider.notifier).state++;
  }
}
