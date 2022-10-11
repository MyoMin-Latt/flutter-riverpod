import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Number_Change_Notifier
class NumberChangeNotifier extends ChangeNotifier {
  final List<int> _numbers = [111];

  UnmodifiableListView<int> get numbers => UnmodifiableListView(_numbers);

  void add(int number) {
    _numbers.add(number);
    notifyListeners();
  }
}

// number_Change_Notifier_Provider
final numberChangeNotifierProvider =
    ChangeNotifierProvider<NumberChangeNotifier>((ref) {
  return NumberChangeNotifier();
});

// ChangeNotifierPage
class ChangeNotifierPage extends ConsumerWidget {
  const ChangeNotifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberChangeNotifierState = ref.watch(numberChangeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier Provider'),
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
          ref.read(numberChangeNotifierProvider.notifier).add(111);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
