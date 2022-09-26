import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/Ukuran.dart';
import 'package:smartscout/Constant/Warna.dart';

class DownloadSejarah extends StatefulWidget {
  const DownloadSejarah({Key? key}) : super(key: key);

  @override
  _DownloadSejarahState createState() => _DownloadSejarahState();
}

class _DownloadSejarahState extends State<DownloadSejarah> {
  Dio dio = Dio();
  double progress = 0.0;

  void startDownloading() async {
    const String url = 'https://www.dropbox.com/s/phny1se13f3znoa/SmartScout_Sejarah-Pramuka-Indonesia.pdf?dl=1';
    const String fileName = "SmartScout_Sejarah-Pramuka-Indonesia.pdf";

    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    if (statuses[Permission.storage]!.isGranted) {
      String path = await _getFilePath(fileName);

      await dio.download(
        url,
        path,
        onReceiveProgress: (recivedBytes, totalBytes) {
          setState(() {
            progress = recivedBytes / totalBytes;
          });

          print(progress);
        },
        deleteOnError: true,
      ).then((_) {
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: "Download selesai.\n File tersimpan di internal folder SmartScout",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: warnaUngu,
            textColor: Colors.white,
            fontSize: ukFormTulisanSedang
        );
      });
    }
  }

  Future<String> _getFilePath(String filename) async {
    Directory? dir;
    dir = await getExternalStorageDirectory();

    String newPath = "";
    print(dir);
    List<String>? paths = dir?.path.split("/");
    for (int x = 1; x < paths!.length; x++) {
      String folder = paths[x];
      if (folder != "Android") {
        newPath += "/" + folder;
      } else {
        break;
      }
    }
    newPath = newPath + "/" + folderSS;
    dir = Directory(newPath);

    return "$newPath/$filename";
  }

  @override
  void initState() {
    super.initState();
    startDownloading();
  }

  @override
  Widget build(BuildContext context) {
    String downloadingprogress = (progress * 100).toInt().toString();

    return AlertDialog(
      backgroundColor: warnaHitam,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator.adaptive(),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Downloading: $downloadingprogress%",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
