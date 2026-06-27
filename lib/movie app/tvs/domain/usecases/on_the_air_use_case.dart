import 'package:clean_architecture_and_solid_principles/movie%20app/core/errors/failure.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/tvs/domain/usecases/base_tv.dart';
import 'package:dartz/dartz.dart';

import '../entities/tv.dart';
import '../repository/base_tv_repository.dart';

class OnTheAirUseCase implements BaseTvUseCase<List<Tv>, NoParameters> {
  final BaseTvRepository tvRepository;

  OnTheAirUseCase(this.tvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(NoParameters parameters) async {
    return await tvRepository.getOnTheAir();
  }
}
