import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/errors/failure.dart';

abstract class BaseTvUseCase <T,P>{

  Future<Either<Failure,T>> call(P parameters);
}

class TvDetailsParameters extends Equatable{
  final int tvId;
 const TvDetailsParameters({required this.tvId});
  @override
  List<Object?> get props => [tvId];
}


