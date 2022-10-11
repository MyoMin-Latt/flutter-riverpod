import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// State Notifier
class NumberStateNotifier extends StateNotifier<List<int>> {
  NumberStateNotifier() : super([11]);

  void add(int number) {
    state = [...state, number];
  }

  // not use now
  // void delete(int number) {
  //   state = [
  //     for (final loopNumber in state)
  //       if (number != loopNumber) loopNumber
  //   ];
  // }
}

// State Notifier Provider
final numberStateNotifierProvider =
    StateNotifierProvider<NumberStateNotifier, List<int>>((ref) {
  return NumberStateNotifier();
});

// StateNotifierPage
class StateNotifierPage extends ConsumerWidget {
  const StateNotifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberNotifierState = ref.watch(numberStateNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier Provider'),
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
        onPressed: () {
          ref.read(numberStateNotifierProvider.notifier).add(10);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
