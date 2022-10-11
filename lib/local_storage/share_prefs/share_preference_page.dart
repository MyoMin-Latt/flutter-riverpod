import 'package:flutter/material.dart';

class SharePreferencePage extends StatelessWidget {
  const SharePreferencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Preference'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('ADD'))
          ],
        ),
      ),
    );
  }
}
