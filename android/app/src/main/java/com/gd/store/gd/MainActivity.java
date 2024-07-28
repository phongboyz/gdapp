package com.gd.store.gd;

import android.annotation.SuppressLint;
//import android.content.ComponentName;
//import android.content.Context;
//import android.content.Intent;
//import android.content.ServiceConnection;
//import android.os.IBinder;
//import android.os.RemoteException;
//import android.util.Log;
import androidx.annotation.NonNull;
import java.util.Map;
//import com.iposprinter.iposprinterservice.*;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    // Note: this method is MethodChannel on the main thread.
    private static final String CHANNEL = "taradOnline";

//    private IPosPrinterService mIPosPrinterService;
//    private IPosPrinterCallback callback = null;
    private int printerStatus = 0;
    // private final int PRINTER_NORMAL = 0;

    @SuppressLint("LongLogTag")
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            @SuppressWarnings("unchecked")
                            Map<String, String> args = (Map<String, String>) call.arguments;
                            String message = args.get("message");
                            // Note: this method is invoked on the main thread.
                            if (call.method.equals("dataDeep")) {
                                // Toast.makeText(this, "Message test", Toast.LENGTH_SHORT).show();
                                // goPrint();
                            }
                            // else if (call.method.equals("goPrint")) {
                            // Toast.makeText(this, "Message test", Toast.LENGTH_SHORT).show();
                            //// int resultValue = goPrint();
                            //// if (resultValue != -1) {
                            //// result.success(resultValue);
                            //// } else {
                            //// result.error("UNAVAILABLE", "Battery level not available.", null);
                            //// }
                            // }
                            // else {
                            // result.notImplemented();
                            // }
                        });
    }

    // @SuppressLint("LongLogTag")
    // private void goPrint() {
    // Log.d("========= goPrint ==========", "activity goPrint");
    // // onResume();
    // printText();
    // }

    // private ServiceConnection connectService = new ServiceConnection() {
    // @Override
    // public void onServiceConnected(ComponentName name, IBinder service) {
    // mIPosPrinterService = IPosPrinterService.Stub.asInterface(service);
    // }

    // @Override
    // public void onServiceDisconnected(ComponentName name) {
    // mIPosPrinterService = null;
    // }
    // };
    // @SuppressLint("LongLogTag")
    // @Override
    // protected void onResume() {
    // Log.d("========= onResume ==========", "activity onResume");
    // super.onResume();
    // // 绑定服务
    // Intent intent = new Intent();
    // intent.setPackage("com.iposprinter.iposprinterservice");
    // intent.setAction("com.iposprinter.iposprinterservice.IPosPrintService");
    // startService(intent);
    // bindService(intent, connectService, Context.BIND_AUTO_CREATE);
    // }

    // @SuppressLint("LongLogTag")
    // @Override
    // protected void onDestroy() {
    // Log.d("========= onDestroy ==========", "activity onDestroy");
    // super.onDestroy();
    // unbindService(connectService);
    // }

    // public int getPrinterStatus() {
    // try {
    // printerStatus = mIPosPrinterService.getPrinterStatus();
    // } catch (RemoteException e) {
    // e.printStackTrace();
    // }
    // return printerStatus;
    // }

    // public void printText() {
    // try {
    // mIPosPrinterService.printText(" test printing", null);
    // } catch (RemoteException e) {
    // e.printStackTrace();
    // }
    // }

}
