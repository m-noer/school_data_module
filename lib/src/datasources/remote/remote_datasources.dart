import 'package:core_module/core_module.dart';
import 'package:school_data_module/src/models/login_model.dart';
import 'package:school_domain_module/school_domain_module.dart';
import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  Future<LoginEntity> requestLogin(LoginBodyEntity body);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio _client;

  RemoteDataSourceImpl(this._client);

  @override
  Future<LoginEntity> requestLogin(LoginBodyEntity body) async {
    try {
      final response = await _client.post(
        "auth/login",
        data: body.toJson(),
      );
      return LoginModel.fromJson(response.data);
    } on DioError {
      throw ServerException();
    }
  }
}
