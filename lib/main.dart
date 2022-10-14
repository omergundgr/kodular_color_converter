import 'package:clipboard/clipboard.dart';
import 'package:color/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invert_colors/invert_colors.dart';

import 'color_extension.dart';
import 'controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Renk Dönüştürücü',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text('Kodular Renk Dönüştürücü'),
        ),
        body: Center(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.grey[50]),
              child: TextField(
                onChanged: (value) {
                  value = value.replaceAll("#", "");
                  _controller.setColorInt(value.convertInt());
                  _controller.setColor(value);
                },
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "#000000"),
              ),
            ),
            const SizedBox(height: 100),
            Obx(() => _controller.colorInt.isEmpty
                ? const SizedBox()
                : GestureDetector(
                    onTap: () {
                      FlutterClipboard.copy(_controller.colorInt.value);
                      Get.showSnackbar(const GetSnackBar(
                        duration: Duration(seconds: 1),
                        backgroundColor: Colors.white,
                        messageText: Text("Kopyalandı"),
                      ));
                    },
                    child: AnimatedContainer(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      width: Get.width / 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _controller.color.value.toColor(),
                          border: Border.all(color: Colors.blueGrey)),
                      alignment: Alignment.center,
                      duration: const Duration(seconds: 1),
                      child: InvertColors(
                        child: Text(
                          _controller.colorInt.value,
                          style: TextStyle(
                              color: _controller.color.value.toColor(),
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
          ],
        )),
      ),
    );
  }
}
