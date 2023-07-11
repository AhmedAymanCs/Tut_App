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
  RepositoryImpl(
      this._internetInfo,
      this._remoteDataSource
      );
  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async{
    if(await _internetInfo.isConnected)
      {
       try
           {
             final respone = await _remoteDataSource.login(loginRequest);
             if(respone.status==ApiInternalStatus.Sucses)
             {
                  return Right(respone.toDomain());
             }
             else
             {
                return Left(DataSource.);
             }
           }
           catch(error)
    {

      return Left(Failure(11, 'message'));
    }
      }
    else
      {
        return Left(Failure(11, 'message'));
      }
  }
}
