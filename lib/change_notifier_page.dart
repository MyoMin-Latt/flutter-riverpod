import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_flutter_riverpod/notifier/number_change_notifier.dart';
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

final numberChangeNotifierProvider =
    ChangeNotifierProvider<NumberChangeNotifier>((ref) {
  return NumberChangeNotifier();
});

class ChangeNotifierPage extends ConsumerWidget {
  const ChangeNotifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final number = ref.watch(numberProvider);
    final numberState = ref.watch(numberStateProvider);
    final numberNotifierState = ref.watch(numberStateNotifierProvider);
    final numberChangeNotifierState = ref.watch(numberChangeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider: ChangeNotifierProvider'),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: numberChangeNotifierState.numbers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text(numberChangeNotifierState.numbers[index].toString()),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(numberChangeNotifierProvider.notifier).add(11);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void increment(WidgetRef ref) {
    ref.read(numberStateProvider.notifier).state++;
  }
}
