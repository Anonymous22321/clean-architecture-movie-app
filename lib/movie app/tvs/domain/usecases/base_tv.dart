import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';

abstract class BaseTvUseCase <T,P>{

  Future<Either<Failure,T>> call(P parameters);
}


