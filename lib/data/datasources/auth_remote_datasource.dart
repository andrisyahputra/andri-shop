import 'package:andri_shop/common/global_variabel.dart';
import 'package:andri_shop/data/models/request/register_request_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../models/auth_response_model.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel model) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    final response = await http.post(
        Uri.parse('${GlobalVariabel.baseurl}/api/register'),
        headers: headers,
        body: model.toJson());
    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('Server Error');
    }
  }
}
