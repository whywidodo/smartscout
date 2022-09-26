import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/Warna.dart';

class DownloadInternal extends StatefulWidget {
  const DownloadInternal({Key? key}) : super(key: key);

  @override
  _DownloadInternalState createState() => _DownloadInternalState();
}

class _DownloadInternalState extends State<DownloadInternal> {
  String fileurl = "https://fluttercampus.com/sample.pdf";
  double progress = 0.0;

  void startDownloading() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    if(statuses[Permission.storage]!.isGranted){
      Directory? dir;
      if(Platform.isIOS){
        dir = await getExternalStorageDirectory();
      }else{
        dir = Directory('/storage/emulated/0/Download/$folderSS');
        if(!await dir.exists()){
          print("buat folder");
          dir.create();
        }
      }
      if(dir != null){
        String savename = "file.pdf";
        String savePath = dir.path + "/$savename";
        print(savePath);
        //output:  /storage/emulated/0/Download/banner.png

        try {
          await Dio().download(
              fileurl,
              savePath,
              onReceiveProgress: (received, total) {
                if (total != -1) {
                  // print((received / total * 100).toStringAsFixed(0) + "%");
                  setState(() {
                    progress = received / total;
                  });

                }
              });
          print("File is saved to download folder.");
        } on DioError catch (e) {
          print(e.message);
        }
      }
    }else{
      print("No permission to read and write.");
    }
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
      backgroundColor: warnaUngu,
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
