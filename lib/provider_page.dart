import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final numberProvider = Provider<int>((ref) {
  return 42;
});

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider: Use Consumer'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final number = ref.watch(numberProvider);
            return Text(number.toString());
          },
        ),
      ),
    );
  }
}
