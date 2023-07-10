import 'package:acourse/data/network/failure.dart';
import 'package:acourse/data/network/requests.dart';
import 'package:acourse/domain/model/models.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
