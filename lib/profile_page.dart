import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_image/provider/image_provider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadImageClassAsyncValue = ref.watch(loadImageClassFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Page'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: loadImageClassAsyncValue.when(
                  data: (loadImageClass) => FutureBuilder<String>(
                    future: loadImageClass.loadImagePath(),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return snapshot.data != null &&
                                  snapshot.data!.isNotEmpty
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(1000),
                                  child: Image.asset(
                                    snapshot.data!,
                                    width: 100,
                                    height: 100,
                                  ),
                                )
                              : const Text('No image selected');
                        }
                      }
                    },
                  ),
                  loading: () => const CircularProgressIndicator(),
                  error: (err, stack) => Text('Error: $err'),
                ),
              ),
              const SizedBox(width: 20),
              const Text('hoge1100xx@co.jpさん',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
