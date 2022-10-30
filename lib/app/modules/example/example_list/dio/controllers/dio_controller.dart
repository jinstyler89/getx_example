// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DioController extends GetxController {
  final count = 0.obs;
  var getdata = ''.obs;
  var postdata = ''.obs;

  var dio = Dio();

  Future get() async {
    var res = await dio.get(
      'http://192.168.0.5:3000/v1/project/?test1',
      // 'https://www.devio.org/io/flutter_app/json/test_common_model.json',
    );
    getdata.value = res.data.toString();
    print(res.data);
  }

  Future post() async {
    var res = await dio.post('http://192.168.0.5:3000/v1/project/',
        data: {"test10": "test3333333333", "test11": "test4444444"});
    postdata.value = res.data['data'].toString();
    print(res.data);
    print(postdata.value);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

}
