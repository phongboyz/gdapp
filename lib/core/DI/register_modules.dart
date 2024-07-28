import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class InjectionModule {
  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  Logger get logger => Logger();

  @lazySingleton
  InternetConnectionChecker get internetChecker => InternetConnectionChecker();

  @lazySingleton
  ImagePicker get picker => ImagePicker();
  
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
