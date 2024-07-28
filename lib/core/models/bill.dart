import 'package:freezed_annotation/freezed_annotation.dart';
part 'bill.freezed.dart';
part 'bill.g.dart';

@freezed
class Bill with _$Bill {
  const factory Bill({
    String? transaction_date,
    String? invoice_no,
    String? created_at,
    String? customer,
    String? address,
    List<dynamic>? product,
    String? total,
  }) = _Bill;

  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);
}
