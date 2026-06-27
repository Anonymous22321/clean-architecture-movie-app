import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/errors/failure.dart';

abstract class BaseTvUseCase <T,P>{

  Future<Either<Failure,T>> call(P parameters);
}

class NoParameters extends Equatable{
  const NoParameters();
  @override
  List<Object> get props => [];
}

