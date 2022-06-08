import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final numberProvider = Provider<int>((ref) {
  return 422;
});

class ProviderPage2 extends ConsumerWidget {
  const ProviderPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final number = ref.watch(numberProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider: Use Consumer'),
      ),
      body: Center(
        child: Text(number.toString()),
      ),
    );
  }
}
