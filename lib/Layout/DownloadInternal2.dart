import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/Warna.dart';

import '../Constant/Ukuran.dart';

class DownloadInternal2 extends StatefulWidget {
  const DownloadInternal2({Key? key}) : super(key: key);

  @override
  _DownloadInternal2State createState() => _DownloadInternal2State();
}

class _DownloadInternal2State extends State<DownloadInternal2> {
  String fileurl = "https://fluttercampus.com/sample.pdf";
  double progress = 0.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Download File from URL"),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Container(
          margin: EdgeInsets.only(top:50),
          child: Column(
            children: [
              Text("File URL: $fileurl"),
              Divider(),
              ElevatedButton(
                onPressed: () async {
                  Map<Permission, PermissionStatus> statuses = await [
                    Permission.storage,
                  ].request();

                  if(statuses[Permission.storage]!.isGranted){
                    Directory? dir;
                    if(Platform.isIOS){
                      dir = await getExternalStorageDirectory();
                    }else{
                      dir = Directory('/storage/emulated/0/Download/$folderSS');
                      // if(!await dir.exists()) dir = await getExternalStorageDirectory();
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
                                print((received / total * 100).toStringAsFixed(0) + "%");
                                //you can build progressbar feature too
                                setState(() {
                                  progress = received / total;
                                });

                              }
                            });
                        Fluttertoast.showToast(
                            msg: "Download selesai, file tersimpan di folder Download/SmartScout",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: warnaUngu,
                            textColor: Colors.white,
                            fontSize: ukFormTulisanSedang
                        );
                        print("File is saved to download folder.");
                      } on DioError catch (e) {
                        print(e.message);
                      }
                    }
                  }else{
                    Fluttertoast.showToast(
                        msg: "Proses download gagal, hak akses tidak diberikan.",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: warnaRed500,
                        textColor: Colors.white,
                        fontSize: ukFormTulisanSedang
                    );
                    print("No permission to read and write.");
                  }

                },
                child: Text("Download File."),
              )

            ],
          ),
        )
    );
  }

  progressDownload(){
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
            "Downloading: $downloadingprogress %",
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
