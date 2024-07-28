import 'package:gd/core/error/exceptions.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@injectable
class DatabaseService {
  Future<void> setData<T>(
      {required String key, required T data, bool allowClear = false}) async {
    try {
      final box = await Hive.openBox<T>(key);
      if (allowClear) {
        await box.clear();
        await box.add(data);
      } else {
        //duplicate value
        final listData = box.values.toList();
        if (listData.where((el) => el == data).isEmpty) {
          await box.add(data);
        }
      }
      await box.close();
    } on HiveError catch (er) {
      throw CacheException(er.message);
    }
  }
  //   Future<void> addData<T>(
  //     {required String key, required T data}) async {
  //   try {
  //     final box = await Hive.openBox<T>(key);
  //       final listData = box.values.toList();
  //       if (listData.where((el) => el == data).isEmpty) {
  //         await box.add(data);
  //     }
  //     await box.close();
  //   } on HiveError catch (er) {
  //     throw CacheException(er.message);
  //   }
  // }

  Future<List<T>> getData<T>({required String key}) async {
    try {
      final box = await Hive.openBox<T>(key);
      final listData = box.values.toList();
      await box.close();
      return listData;
    } on HiveError catch (err) {
      throw CacheException(err.message);
    }
  }

  Future<T?> findOne<T>({required String key}) async {
    try {
      final box = await Hive.openBox<T>(key);
      final data = box.values;
      // await box.close();
      if (data.isNotEmpty) {
        return data.first;
      } else {
        return null;
      }
    } on HiveError catch (error) {
      throw CacheException(error.message);
    }
  }

  Future<void> delete<T>({required String key}) async {
    try {
      final box = await Hive.openBox<T>(key);
      await box.clear();
      await box.close();
    } on HiveError catch (error) {
      throw CacheException(error.message);
    }
  }

  Future<void> addJson<T>(
      {required String key, required String itemKey, required T data}) async {
    try {
      final box = await Hive.openBox<T>(key);
      // await box.clear();
      await box.put(itemKey, data);
      await box.close();
    } on HiveError catch (error) {
      throw CacheException(error.message);
    }
  }

  Future<void> updateJson<T>(
      {required String key, required String itemKey, required T data}) async {
    try {
      final box = await Hive.openBox<T>(key);
      // await box.clear();
      await box.put(itemKey, data);
      await box.close();
    } on HiveError catch (error) {
      throw CacheException(error.message);
    }
  }

  Future<void> deleteOne<T>({required String key, required int index}) async {
    try {
      final box = await Hive.openBox<T>(key);
      // await box.clear();
      await box.deleteAt(index);
      await box.close();
    } on HiveError catch (error) {
      throw CacheException(error.message);
    }
  }

  Future<int> getLength<T>({required String key}) async {
    try {
      final box = await Hive.openBox<T>(key);
      final listData = box.values.length;
      await box.close();
      return listData;
    } on HiveError catch (err) {
      throw CacheException(err.message);
    }
  }

  Future<double> getSumTotal<T>({required String key}) async {
    try {
      final box = await Hive.openBox<T>(key);
      List listData = box.values.toList();
      double sumTotal = 0.0;
      await box.close();
      listData.fold(0.0, (i, el) {
        sumTotal = sumTotal + double.parse('${el.total}');
        return sumTotal;
      });
      return sumTotal;
    } on HiveError catch (err) {
      throw CacheException(err.message);
    }
  }
}
