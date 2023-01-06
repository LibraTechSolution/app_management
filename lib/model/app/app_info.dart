import 'package:app_manage/model/base_model.dart';

class AppInfoModel extends BaseModel {
  List<PackageInfo>? packageInfo;

  AppInfoModel({this.packageInfo});

  AppInfoModel.fromJson(Map<String, dynamic> json) {
    if (json['packageInfo'] != null) {
      packageInfo = <PackageInfo>[];
      json['packageInfo'].forEach((v) {
        packageInfo!.add(new PackageInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.packageInfo != null) {
      data['packageInfo'] = this.packageInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PackageInfo {
  String? appName;
  int? dateInstall;
  int? icon;
  bool? isSystem;
  String? packageName;
  String? sdkVersion;
  int? versionCode;
  String? versionName;

  PackageInfo(
      {this.appName,
        this.dateInstall,
        this.icon,
        this.isSystem,
        this.packageName,
        this.sdkVersion,
        this.versionCode,
        this.versionName});

  PackageInfo.fromJson(Map<String, dynamic> json) {
    appName = json['appName'];
    dateInstall = json['dateInstall'];
    icon = json['icon'];
    isSystem = json['isSystem'];
    packageName = json['packageName'];
    sdkVersion = json['sdkVersion'];
    versionCode = json['versionCode'];
    versionName = json['versionName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appName'] = this.appName;
    data['dateInstall'] = this.dateInstall;
    data['icon'] = this.icon;
    data['isSystem'] = this.isSystem;
    data['packageName'] = this.packageName;
    data['sdkVersion'] = this.sdkVersion;
    data['versionCode'] = this.versionCode;
    data['versionName'] = this.versionName;
    return data;
  }
}