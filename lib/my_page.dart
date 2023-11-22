import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_image/provider/image_provider.dart';
import 'package:local_image/images.dart';
import 'package:local_image/profile_page.dart';

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Page'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ListViewで横にスライドできるようにする
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () async {
                    // 画像を変更したらpop upを出す
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('画像を変更しました'),
                      ),
                    );
                    await ref.read(loadImageClassProvider).saveImagePath(images[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: AspectRatio(
                        aspectRatio: 1 / 1, // Add this line
                        child: SizedBox(
                          width: 30, // Change this value
                          height: 30, // And this value
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.cover, // And this line
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// class MyPage extends StatefulWidget {
//   const MyPage({super.key});

//   @override
//   _MyPageState createState() => _MyPageState();
// }

// class _MyPageState extends State<MyPage> {




//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // ListViewで横にスライドできるようにする
//           SizedBox(
//             height: 100,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: _images.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return GestureDetector(
//                   onTap: () async {
//                     // 画像を変更したらpop upを出す
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('画像を変更しました'),
//                       ),
//                     );
//                     await _saveImagePath(_images[index]);
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(1000),
//                       child: AspectRatio(
//                         aspectRatio: 1 / 1, // Add this line
//                         child: SizedBox(
//                           width: 30, // Change this value
//                           height: 30, // And this value
//                           child: Image.asset(
//                             _images[index],
//                             fit: BoxFit.cover, // And this line
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
