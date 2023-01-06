package com.healer.lib_app;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.google.gson.Gson;

import java.util.ArrayList;
import java.util.List;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;

/**
 * LibAppPlugin
 */
public class LibAppPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.ActivityResultListener {

    private MethodChannel channel;

    private final static String TAG = "PhoneLibPlugin";

    private Result result = null;
    private Activity activity;
    private final int REQUEST_CODE = 100;
    private final int REQUEST_IMAGE = 101;


    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        Logger.i("PhoneLibPlugin", "#onAttachedToEngine", "");
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "lib_app");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        Logger.i("PhoneLibPlugin", "#onMethodCall", "" + call.method);
        switch (call.method) {
            case "checkapp":
                HandleInfoHelper handleInfoHelper = new HandleInfoHelper();
                ArrayList<PackageInfo> res = handleInfoHelper.getInstalledApps(activity, true);
                Gson gson = new Gson();
                PackageInfoList packageInfoList = new PackageInfoList();
                packageInfoList.packageInfo = res.subList(0,2);
                String json = gson.toJson(packageInfoList);
                Logger.i("onMethodCall", "#onAttachedToEngine", json);
                result.success(json);
                break;
            default:
                break;
        }
        if (call.method.equals("getPlatformVersion")) {
            result.success("Android " + android.os.Build.VERSION.RELEASE);
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
        Logger.i("PhoneLibPlugin", "#onDetachedFromEngine", "");

    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        Logger.i("PhoneLibPlugin", "#onAttachedToActivity", "");
        activity = binding.getActivity();
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        Logger.i("PhoneLibPlugin", "#onDetachedFromActivityForConfigChanges", "");

    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        Logger.i("PhoneLibPlugin", "#onReattachedToActivityForConfigChanges", "");

    }

    @Override
    public void onDetachedFromActivity() {
        Logger.i("PhoneLibPlugin", "#onDetachedFromActivity", "");


    }

    @Override
    public boolean onActivityResult(int code, int resultCode, @Nullable Intent intent) {
        Logger.i("PhoneLibPlugin", "#onActivityResult", "");

        if (code == REQUEST_CODE) {
            if (resultCode == Activity.RESULT_OK && intent != null) {
                Bundle secondBundle = intent.getBundleExtra("secondBundle");
                if (secondBundle != null) {

                } else {
                    Bundle bundle = intent.getExtras();

                }
            } else {
                String errorCode = intent != null ? intent.getStringExtra("ERROR_CODE") : null;
                if (errorCode != null) {
                    this.result.error(errorCode, null, null);
                }
            }
            return true;
        } else if (code == REQUEST_IMAGE) {
            if (intent != null) {

            }
            return true;
        }
        return false;
    }
}
