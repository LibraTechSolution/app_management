import 'dart:convert';

import 'package:app_manage/model/app/app_info.dart';
import 'package:flutter/services.dart';

import 'blocs.dart';

class AppBlocs extends BaseBloc<AppInfoModel> {
  Stream<AppInfoModel> get appReport => fetcher.stream;

  getAppInfo() async {
    var data =
        await const MethodChannel('lib_app').invokeMethod<String>("checkapp");
    AppInfoModel appInfoModel = AppInfoModel.fromJson(json.decode(data ?? ""));
    fetcher.sink.add(appInfoModel);
  }
}

final appBlocs = AppBlocs();
