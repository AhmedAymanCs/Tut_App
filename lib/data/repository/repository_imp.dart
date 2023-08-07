// ignore_for_file: unrelated_type_equality_checks

import 'package:acourse/data/dataSource/remote_data_source.dart';
import 'package:acourse/data/mapper/mapper.dart';
import 'package:acourse/data/network/error_handler.dart';
import 'package:acourse/data/network/failure.dart';
import 'package:acourse/data/network/internet_info.dart';
import 'package:acourse/data/network/requests.dart';
import 'package:acourse/domain/model/models.dart';
import 'package:acourse/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository {
  final InternetInfo _internetInfo;
  final RemoteDataSource _remoteDataSource;

  RepositoryImpl(this._internetInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _internetInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(ApiInternalStatus.Failure,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
