import 'package:hooks_riverpod/hooks_riverpod.dart';

class NumberNotifier extends StateNotifier<List<int>> {
  NumberNotifier() : super([]);

  void add(int number) {
    state = [...state, number];
  }

  void delete(int number) {
    state = [
      for (final loopNumber in state)
        if (number != loopNumber) loopNumber
    ];
  }
}
