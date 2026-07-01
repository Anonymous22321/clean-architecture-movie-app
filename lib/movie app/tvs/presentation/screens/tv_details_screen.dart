import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/tvs/domain/entities/recommendations.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/tvs/domain/entities/tv_details.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/tvs/presentation/controller/tv_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/utilizes/constance.dart';
import '../../../movies/domain/entities/genres.dart';
import '../../domain/entities/seasons.dart';

class TvDetailScreen extends StatelessWidget {
  const TvDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MovieDetailContent());
  }
}

class MovieDetailContent extends GetView<TvController> {
  const MovieDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value || controller.tvDetails.value == null) {
        return const Center(
          child: CircularProgressIndicator(color: Colors.redAccent),
        );
      }
      final error = controller.errorMessage.value;
      final TvDetails tv = controller.tvDetails.value!;
      print(tv.tvId);

      return CustomScrollView(
        key: const Key('tvDetailScrollView'),
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back_ios),
            ),
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: FadeIn(
                duration: const Duration(milliseconds: 500),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black,
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [0.0, 0.5, 1.0, 1.0],
                    ).createShader(
                      Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                    );
                  },
                  blendMode: BlendMode.dstIn,
                  child: CachedNetworkImage(
                    width: Get.width,
                    imageUrl: imageUrl(tv.backdropPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FadeInUp(
              from: 20,
              duration: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tv.name,
                      style: GoogleFonts.poppins(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2.0,
                            horizontal: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            tv.firstAirDate.split('-')[0],
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20.0,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              (tv.voteAverage / 2).toStringAsFixed(1),
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              '(${tv.voteAverage})',
                              style: const TextStyle(
                                fontSize: 1.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16.0),
                        Text(
                          _showDuration(tv.runtime),
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      tv.overview,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Genres: ${_showGenres(tv.genres)}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
            sliver: SliverToBoxAdapter(
              child: FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: Text(
                  'More like this'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ),
          // Tab(text: 'More like this'.toUpperCase()),
          // SliverPadding(
          //   padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
          //   sliver: _showRecommendations(),
          //
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
            sliver: _showSeasons(),
          ),
        ],
      );
    });
  }

  String _showGenres(List<Genres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  Widget _showSeasons() {
    final List<Season> seasons = controller.seasons;

    // If seasons list is empty, return an empty sliver placeholder to avoid crashes
    if (seasons.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            DropdownButton<int>(
              dropdownColor: Colors.grey.shade800,
              // Matches your app's dark theme
              style: GoogleFonts.redHatDisplay(
                color: Colors.white,
                fontSize: 16,
              ),
              isExpanded: true,
              // Forces the dropdown to fill horizontal space nicely
              value: controller.selectedSeasonIndex.value,
              // Hardcoded placeholder index; replace with a controller variable later
              items: List.generate(seasons.length, (index) {
                final season = seasons[index];
                print(season);
                return DropdownMenuItem<int>(
                  value: index,
                  child: Text(
                    season.name,
                    style: GoogleFonts.redHatDisplay(fontSize: 21),
                  ),
                );
              }),
              onChanged: (int? value) {
                // Handle season selection state shifts inside your controller here
                controller.changeSeason(value!);
              },
            ),
            const SizedBox(height: 8.0),
            ListView.separated(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount:
                  seasons[controller.selectedSeasonIndex.value].episodes.length,
              itemBuilder: (context, index) {
                final episode = seasons[controller.selectedSeasonIndex.value]
                    .episodes[index];

                return Container(
                  width: Get.width,
                  decoration: BoxDecoration().copyWith(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.grey.shade900,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            child: CachedNetworkImage(
                              height: Get.height * .07,
                              width: 120.0,
                              fit: BoxFit.fill,
                              imageUrl: imageUrl(episode.stillPath),
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[800]!,
                                child: Container(
                                  height: 150.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${episode.episodeNumber}.${episode.name}",
                                  style: GoogleFonts.redHatDisplay(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,

                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  episode.airDate,
                                  style: GoogleFonts.redHatDisplay(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        episode.overview,
                        style: GoogleFonts.redHatDisplay(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 50.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showRecommendations() {
    final List<TvRecommendations> recommendations = controller.recommendations;
    print(recommendations);

    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        final recommendation = recommendations[index];
        return FadeInUp(
          from: 20,
          duration: const Duration(milliseconds: 500),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            child: GestureDetector(
              onTap: () async {
                await controller.fetchTvDetails(recommendation.tvId);
              },
              child: CachedNetworkImage(
                imageUrl: imageUrl(recommendation.backdropPath),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[850]!,
                  highlightColor: Colors.grey[800]!,
                  child: Container(
                    height: 170.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 180.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }, childCount: controller.recommendations.length),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.7,
        crossAxisCount: 3,
      ),
    );
  }
}
