import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IntListNotifier extends Notifier<List<int>> {
  @override
  build() => [10];

  void deleteEven() {
    List<int> data = state;
    data.removeWhere((element) => element.isEven);
    state = data;
  }
}

final intListProvider =
    NotifierProvider<IntListNotifier, List<int>>(IntListNotifier.new);

class Notifierpage extends ConsumerStatefulWidget {
  const Notifierpage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotifierpageState();
}

class _NotifierpageState extends ConsumerState<Notifierpage> {
  @override
  Widget build(BuildContext context) {
    final intList = ref.watch(intListProvider);
    final intListNotifier = ref.read(intListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifier'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(intListProvider.notifier).deleteEven();
              },
              icon: const Icon(Icons.delete)),
          const SizedBox(width: 18),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: ref.watch(intListProvider).length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Card(
                  child: ListTile(
                title: Text(intList[index].toString()),
                trailing: IconButton(
                  onPressed: () {
                    intListNotifier.removeAt(index);
                    setState(() {});
                  },
                  icon: const Icon(Icons.close),
                ),
              )),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var twoDigit = Random().nextInt(30);
          intListNotifier.add(twoDigit);
          intListNotifier.sort();
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
