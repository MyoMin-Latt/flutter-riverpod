import 'package:hooks_riverpod/hooks_riverpod.dart';

class NumberStateNotifier extends StateNotifier<List<int>> {
  NumberStateNotifier() : super([]);

  void add(int number) {
    state = [...state, number];
  }

  // not use now
  void delete(int number) {
    state = [
      for (final loopNumber in state)
        if (number != loopNumber) loopNumber
    ];
  }
}
