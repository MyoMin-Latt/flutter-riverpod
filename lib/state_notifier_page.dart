import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// State Notifier
class NumberStateNotifier extends StateNotifier<List<int>> {
  NumberStateNotifier() : super([]);

  void add(int number) {
    state = [...state, number];
  }

  void clear() {
    state = [];
  }

  void deleteByIndex(int index) {
    state = [
      for (var i = 0; i < state.length; i++)
        if (i != index) state[i],
        
    ];
  }

  void deleteNumber(int number) {
    state = [
      for (final loopNumber in state)
        if (number != loopNumber) loopNumber
    ];
  }
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
    ref.listen<List<int>>(
      numberStateNotifierProvider,
      (previous, next) {
        debugPrint("numberStateNotifierProvider, $next");
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider: StateNotifier'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(numberStateNotifierProvider.notifier).clear();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: ListView.builder(
            itemCount: numberNotifierState.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Card(
                    child: ListTile(
                  title: Text(numberNotifierState[index].toString()),
                  trailing: IconButton(
                      onPressed: () {
                        // ref
                        //     .read(numberStateNotifierProvider.notifier)
                        //     .deleteNumber(numberNotifierState[index]);
                        ref
                            .read(numberStateNotifierProvider.notifier)
                            .deleteByIndex(index);
                      },
                      icon: const Icon(Icons.close)),
                )),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var twoDigit = Random().nextInt(30);
          ref.read(numberStateNotifierProvider.notifier).add(twoDigit);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
