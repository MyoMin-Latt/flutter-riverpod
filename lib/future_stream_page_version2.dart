import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// final futureProvider = FutureProvider.autoDispose<int>(
//   (ref) {
//     return Future.value(123);
//   },
// );

// final streamProvider = StreamProvider.autoDispose<int>(
//   (ref) {
//     return Stream.value(456);
//   },
// );

final futureProvider = FutureProvider<int>(
  (ref) => 123,
);

final streamProvider = StreamProvider<int>(
  (ref) => Stream.value(ref.watch(numberStateProviderWithStream)),
);

final numberStateProviderWithStream = StateProvider<int>((ref) {
  return 44;
});

class FutureStreamPageV2 extends ConsumerWidget {
  const FutureStreamPageV2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamNumber = ref.watch(streamProvider);
    final futureNumber = ref.watch(futureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider: Future & Stream Provider'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text('Future Number'),
          Center(
            child: futureNumber.when(
              data: (data) => Center(child: Text(data.toString())),
              error: (e, s) => const Center(child: Text('Error')),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text('Stream Number'),
          Center(
            child: streamNumber.maybeWhen(
              orElse: () => null,
              data: (data) => Center(child: Text(data.toString())),
              error: (e, s) => const Center(child: Text('Error')),
              // loading: () => const Center(
              //   child: CircularProgressIndicator(),
              // ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(numberStateProviderWithStream.notifier).state++;
          // var streamNum = ref.read(streamProvider);
          // print(streamNum);
        },
        child: const Icon(Icons.change_history),
      ),
    );
  }
}
