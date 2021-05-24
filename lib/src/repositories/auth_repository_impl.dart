import 'package:core_module/core_module.dart';
import 'package:dartz/dartz.dart';
import 'package:school_data_module/src/datasources/remote/remote_datasources.dart';
import 'package:school_domain_module/school_domain_module.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, LoginEntity>> requestLogin(
      LoginBodyEntity body) async {
    try {
      final login = await _remoteDataSource.requestLogin(body);
      return Right(login);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
