import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<int> fetchWeather() async {
  await Future.delayed(const Duration(seconds: 2));
  return 20;
}

// final futureProvider = FutureProvider<int>((ref) => fetchWeather());
final futureProvider = FutureProvider.autoDispose<int>((ref) => fetchWeather());

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureProvider'),
      ),
      body: Center(
        child: future.when(
          data: (data) => Text(
            data.toString(),
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          error: (error, stackTrace) => Text("Error: $error"),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
