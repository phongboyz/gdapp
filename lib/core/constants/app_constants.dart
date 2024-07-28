import 'package:pdf/pdf.dart';

enum DataStatus {
  initial,
  loading,
  success,
  failure,
}

enum ImageType {
  none,
  cover,
  profile,
  course,
}

enum AppLanguage { lo, en }

enum CourseType {
  online,
  offine,
}

class UserRole {
  static const String student = "user";
  static const String teacher = "admin";
}

class DatabaseKey {
  static const String dbName = 'GD_store';
  static const String userKey = "users";
  static const String cartKey = "cart";
}

class PrintData {
  static const formats = PdfPageFormat.a4;
}
