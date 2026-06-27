import 'package:clean_architecture_and_solid_principles/movie%20app/core/errors/failure.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/tvs/domain/usecases/base_tv.dart';
import 'package:dartz/dartz.dart';

import '../entities/tv.dart';
import '../repository/base_tv_repository.dart';

class PopularUseCase implements BaseTvUseCase<List<Tv>, NoParameters> {
  final BaseTvRepository tvRepository;

  PopularUseCase(this.tvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(NoParameters parameters) async {
    return await tvRepository.getPopular();
  }
}
