import 'package:get/get.dart';

import '../../../movies/domain/usecases/base.dart';
import '../../domain/entities/tv.dart';
import '../../domain/usecases/on_the_air_use_case.dart';
import '../../domain/usecases/popular_use_case.dart';
import '../../domain/usecases/top_rated_use_case.dart';

class TvController extends GetxController {
  final GetPopularTvUseCase getPopularUseCase;
  final GetTopRatedTvUseCase getTopRatedUseCase;
  final GetOnTheAirUseCase getOnTheAirUseCase;

  /// Lists
  final RxList<Tv> popularTvList = <Tv>[].obs;
  final RxList<Tv> topRatedTvList = <Tv>[].obs;
  final RxList<Tv> onTheAirTvList = <Tv>[].obs;

  /// error
  final RxnString errorMessage = RxnString();

  /// loading
  final RxBool _isLoading = false.obs;

  RxBool get isLoading => _isLoading;

  TvController({
    required this.getPopularUseCase,
    required this.getTopRatedUseCase,
    required this.getOnTheAirUseCase,
  });

  @override
  void onInit() {
    fetchPopular();
    fetchTopRated();
    fetchOnTheAir();
    super.onInit();
  }

  Future<void> fetchPopular() async {
    _isLoading.value = true;
    final result = await getPopularUseCase(const NoParameters());
    result.fold(
      (failure) => errorMessage.value = failure.errMessage,
      (success) => popularTvList.value = success,
    );
    _isLoading.value = false;
  }

  Future<void> fetchTopRated() async {
    _isLoading.value = true;
    final result = await getTopRatedUseCase(const NoParameters());
    result.fold(
          (failure) => errorMessage.value = failure.errMessage,
          (success) => topRatedTvList.value = success,
    );
    _isLoading.value = false;
  }

  Future<void> fetchOnTheAir() async {
    _isLoading.value = true;
    final result = await getOnTheAirUseCase(const NoParameters());
    result.fold(
          (failure) => errorMessage.value = failure.errMessage,
          (success) => onTheAirTvList.value = success,
    );
    _isLoading.value = false;
  }
}
