import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  var channel = const MethodChannel("taradOnline");
  // Future<void> showToast() async {
  //   try {
  //     await channel
  //         .invokeMethod("dataDeep", {'message': "this message from flutter"});
  //   } catch (e) {
  //     _resultValue = e.toString();
  //     setState(() {});
  //   }
  // }

  String _resultValue = "unknown printer ";
  Future<void> goPrint() async {
    String resultValue;
    try {
      // final int result =
      //  await channel.invokeMethod('goPrint');
      await channel
          .invokeMethod("dataDeep", {'message': "this message from flutter"});
      resultValue = 'result';
    } on PlatformException catch (e) {
      resultValue = "${e.message}";
    }
    setState(() {
      _resultValue = resultValue;
    });
    // print(resultValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  goPrint();
                },
                child: const Text('showToast')),
            // TextButton(onPressed: goPrint, child: const Text('goPrint')),
            Text("result : $_resultValue")
          ],
        ),
      ),
    );
  }
}
