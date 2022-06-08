import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_flutter_riverpod/notifier/number_state_notifier.dart';

final numberProvider = Provider<int>((ref) {
  return 42;
});

final numberStateProvider = StateProvider<int>((ref) {
  return 44;
});

final numberStateNotifierProvider =
    StateNotifierProvider<NumberStateNotifier, List<int>>((ref) {
  return NumberStateNotifier();
});

class StateNotifierPage extends ConsumerWidget {
  const StateNotifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final number = ref.watch(numberProvider);
    final numberState = ref.watch(numberStateProvider);
    final numberNotifierState = ref.watch(numberStateNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider: StateNotifierProvider'),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: numberNotifierState.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(numberNotifierState[index].toString()),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Colors.green,
        onPressed: () {
          ref.read(numberStateNotifierProvider.notifier).add(10);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void increment(WidgetRef ref) {
    ref.read(numberStateProvider.notifier).state++;
  }
}
