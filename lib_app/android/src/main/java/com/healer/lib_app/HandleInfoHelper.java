package com.healer.lib_app;

import android.app.Activity;
import android.os.Build;

import java.util.ArrayList;
import java.util.List;

class HandleInfoHelper {


    public ArrayList<PackageInfo> getInstalledApps(Activity activity,boolean getSysPackages) {
        ArrayList<PackageInfo> res = new ArrayList<>();
        List<android.content.pm.PackageInfo> packs = activity.getPackageManager().getInstalledPackages(0);

        for(int i=0;i<packs.size();i++) {
            android.content.pm.PackageInfo p = packs.get(i);
            if ((!getSysPackages) && (p.versionName == null)) {
                continue ;
            }

            PackageInfo newInfo = new PackageInfo();
            newInfo.appName = p.applicationInfo.loadLabel(activity.getPackageManager()).toString();
            newInfo.packageName = p.packageName;
            newInfo.dateInstall = p.firstInstallTime;
            newInfo.isSystem = p.versionName == null;
            newInfo.versionName = p.versionName;
            newInfo.versionCode = p.versionCode;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                newInfo.sdkVersion = p.applicationInfo.compileSdkVersionCodename;
            }
            newInfo.icon = p.applicationInfo.icon;
            Logger.i("getInstalledApps", "#getInstalledApps", activity.getPackageManager().toString());

            Logger.i("getInstalledApps", "#getInstalledApps", p.applicationInfo.loadIcon(activity.getPackageManager()).toString());

            res.add(newInfo);
        }
        return res;
    }
}