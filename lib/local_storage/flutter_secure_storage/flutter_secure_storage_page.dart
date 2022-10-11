import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecureStoragePage extends StatelessWidget {
  const FlutterSecureStoragePage({Key? key}) : super(key: key);
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return SecureStoragePage(
      storage: storage,
    );
  }
}

class SecureStoragePage extends StatefulWidget {
  final FlutterSecureStorage storage;
  const SecureStoragePage({Key? key, required this.storage}) : super(key: key);

  @override
  State<SecureStoragePage> createState() => _SecureStoragePageState();
}

class _SecureStoragePageState extends State<SecureStoragePage> {
  String stringData = '';
  String readStringData = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Secure Storage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              onChanged: (value) {
                stringData = value;
                print(stringData);
              },
            ),
            OutlinedButton(
              onPressed: () {
                widget.storage.write(
                  key: 'key',
                  value: stringData,
                );
                print('SaveData => $stringData');
              },
              child: const Text(
                'Save',
              ),
            ),
            ListTile(
              focusColor: Colors.red,
              tileColor: Colors.amber,
              // shape: RoundedRectangleBorder(
              //     side: const BorderSide(
              //         color: Colors.red, width: 10, style: BorderStyle.solid),
              //     borderRadius: BorderRadius.circular(12)),
              // shape: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(12),
              // ),
              title: Text(readStringData),
            ),
            OutlinedButton(
              onPressed: () async {
                var readData = await widget.storage.read(key: 'key');
                setState(() {
                  readStringData = readData ?? '';
                });
                print('Read Data => $readData');
              },
              child: const Text('Read Data'),
            ),
          ],
        ),
      ),
    );
  }
}
