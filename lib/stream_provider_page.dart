import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final streamProvider =
    StreamProvider.autoDispose<String>((ref) => Stream.periodic(
          const Duration(milliseconds: 400),
          (count) => "$count",
        ));

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider'),
      ),
      body: Center(
        child: buildStreamBuilder(ref),
      ),
    );
  }

  Widget buildStreamBuilder(WidgetRef ref) {
    final stream = ref.watch(streamProvider);
    return stream.when(
      data: (data) => Text(
        data.toString(),
        style: const TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
      ),
      error: (error, stackTrace) => Text("Error: $error"),
      loading: () => const CircularProgressIndicator(),
    );
  }
  // Widget buildStreamBuilder(WidgetRef ref) {
  //   return StreamBuilder<String>(
  //     stream: ref.watch(streamProvider.stream),
  //     builder: (context, snapshot) {
  //       switch (snapshot.connectionState) {
  //         case ConnectionState.waiting:
  //           return const CircularProgressIndicator();
  //         default:
  //           if (snapshot.hasError) {
  //             return Text("Error: ${snapshot.error}");
  //           } else {
  //             final counter = snapshot.data;
  //             return Text(counter.toString());
  //           }
  //       }
  //     },
  //   );
  // }
}
