import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Number_Change_Notifier
class NumberChangeNotifier extends ChangeNotifier {
  List<int> _numbers = [];

  UnmodifiableListView<int> get numbers => UnmodifiableListView(_numbers);

  void add(int number) {
    _numbers.add(number);
    notifyListeners();
  }

  void clear() {
    _numbers = [];
    notifyListeners();
  }

  void deleteByIndex(int index) {
    _numbers.removeAt(index);
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
        title: const Text('Provider: ChangeNotifier'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(numberChangeNotifierProvider.notifier).clear();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: ListView.builder(
            itemCount: numberChangeNotifierState.numbers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Card(
                    child: ListTile(
                  title:
                      Text(numberChangeNotifierState.numbers[index].toString()),
                  trailing: IconButton(
                      onPressed: () {
                        ref
                            .read(numberChangeNotifierProvider.notifier)
                            .deleteByIndex(index);
                      },
                      icon: const Icon(Icons.close)),
                )),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var digit = Random().nextInt(30);
          ref.read(numberChangeNotifierProvider.notifier).add(digit);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
