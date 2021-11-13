import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class RoughDownloader extends StatefulWidget {
  const RoughDownloader({Key? key}) : super(key: key);

  @override
  State<RoughDownloader> createState() => _RoughDownloaderState();
}

class _RoughDownloaderState extends State<RoughDownloader> {
  int progress = 0;
  var taskId;
  ReceivePort _receivePort = ReceivePort();

  static downloadingCallBack(id, status, progress) {
    //looking up for a send port
    SendPort? sendPort = IsolateNameServer.lookupPortByName('downloading');
    //sending the data
    sendPort!.send([id, status, progress]);
  }

  @override
  void initState() {
    super.initState();
    //register a send port for the other isolates
    IsolateNameServer.registerPortWithName(
        _receivePort.sendPort, 'downloading');

    //listening for data thats comming from other isolates
    _receivePort.listen((message) {
      setState(() {
        progress = message[2];
      });
      print('This is the progress value: $progress');
    });
    FlutterDownloader.registerCallback(downloadingCallBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LinearProgressIndicator(
            //   backgroundColor: Colors.grey,
            //   valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            //   value: progress.toDouble(),
            //   minHeight: 60,
            // ),
            Text('downloading $progress'),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                final status = await Permission.storage.request();

                if (status.isGranted) {
                  final externalDir = await getExternalStorageDirectory();

                  taskId = await FlutterDownloader.enqueue(
                    url:
                        "https://file-examples.com/wp-content/uploads/2017/10/file-example_PDF_1MB.pdf",
                    savedDir: externalDir!.path,
                    fileName: 'download',
                    showNotification: true,
                    openFileFromNotification: true,
                    saveInPublicStorage: true,
                  );
                } else {
                  print('Permission denied!');
                }
              },
              child: Text('Download'),
            ),
            TextButton(
                onPressed: () {
                  FlutterDownloader.open(taskId: taskId);
                },
                child: Text('Open'))
          ],
        ),
      ),
    );
  }
}
