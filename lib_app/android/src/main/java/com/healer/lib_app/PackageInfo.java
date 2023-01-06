package com.healer.lib_app;

import android.graphics.drawable.Drawable;
import android.util.Log;

import java.util.List;

public class PackageInfo {
    public String appName = "";
    public String packageName = "";
    public long dateInstall ;
    public String versionName = "";
    public boolean isSystem = false;
    public String sdkVersion = "";
    public int versionCode = 0;
    public int icon;
}

class PackageInfoList {
    public List<PackageInfo> packageInfo;
}