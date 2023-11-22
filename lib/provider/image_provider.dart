import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


final loadImageClassFutureProvider = FutureProvider<LoadImageClass>((ref) async {
  return LoadImageClass();
});

final loadImageClassProvider = Provider<LoadImageClass>((ref) {
  return LoadImageClass();

  });


class LoadImageClass {
  Future<void> saveImagePath(String imagePath) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('imagePath', imagePath);
  }

  Future<String> loadImagePath() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('imagePath') ?? '';
  }
}
