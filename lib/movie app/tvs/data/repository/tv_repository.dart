import 'package:clean_architecture_and_solid_principles/movie%20app/core/errors/exceptions.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/core/errors/failure.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/tvs/data/datasource/base_tv_remote_datasource.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/tvs/domain/entities/tv.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/tvs/domain/repository/base_tv_repository.dart';
import 'package:dartz/dartz.dart';

class TvRepository implements BaseTvRepository {
  final BaseTvRemoteDatasource baseTvRemoteDataSource;

  TvRepository(this.baseTvRemoteDataSource);

  @override
  Future<Either<Failure, List<Tv>>> getOnTheAir() async {
    try{
    final result =  await baseTvRemoteDataSource.getOnTheAir();
    return Right(result);
    }on ServerExceptions catch(failure){
     return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getPopular() async{
    try{
      final result =  await baseTvRemoteDataSource.getPopular();
      return Right(result);
    }on ServerExceptions catch(failure){
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRated() async{
    try{
      final result =  await baseTvRemoteDataSource.getTopRated();
      return Right(result);
    }on ServerExceptions catch(failure){
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }
}
