import 'package:clean_architecture_and_solid_principles/movie%20app/core/errors/failure.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/tvs/domain/entities/tv.dart';
import 'package:dartz/dartz.dart';

abstract class BaseTvRepository {
Future<Either<Failure,List<Tv>>> getOnTheAir();
Future<Either<Failure,List<Tv>>> getPopular();
Future<Either<Failure,List<Tv>>> getTopRated();

}