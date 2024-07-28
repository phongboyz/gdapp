import 'package:dio/dio.dart';
import 'package:gd/core/constants/api_path.dart';
import 'package:gd/core/models/bill.dart';
import 'package:gd/core/models/dashboard.dart';
import 'package:gd/core/models/member.dart';
import 'package:gd/core/models/product.dart';
import 'package:gd/core/models/user.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'network_call.g.dart';

@RestApi(baseUrl: APIPath.baseUrl)
@singleton
abstract class NetworkCall {
  @factoryMethod
  factory NetworkCall(Dio dio) = _NetworkCall;

  @POST(APIPath.loginUrl)
  Future<User> login(@Body() dynamic body);

  @GET(APIPath.dashboardUrl)
  Future<Dashboard> dashboard(@Header("Authorization") String token);

  @POST(APIPath.changePassword)
  Future<String> changePassword(
      @Header("Authorization") String token, @Body() dynamic body);

  @POST(APIPath.searchProduct)
  Future<Product> searchProduct(
      @Header("Authorization") String token, @Body() dynamic body);

  @POST(APIPath.updateProfile)
  Future<String> updateProfile(
      @Header("Authorization") String token, @Body() dynamic body);

  @POST(APIPath.member)
  Future<Member> member(
      @Header("Authorization") String token, @Body() dynamic body);

  @POST(APIPath.sellProduct)
  Future<String> sellProduct(
      @Header("Authorization") String token, @Body() dynamic body);

  @PUT("${APIPath.getBill}/{code}")
  Future<Bill> getBill(
      @Header("Authorization") String token, @Path('code') String code);
}
