import 'package:clean_architecture_and_solid_principles/movie%20app/movies/presentation/components/rebuilding%20components/full_movie_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/movie_controller.dart';


class TopRatedMoviesFullList extends GetView<MovieController> {
  const TopRatedMoviesFullList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Rated Movies"),
        centerTitle: true,
        titleTextStyle: GoogleFonts.redHatDisplay(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(12.0),
            sliver: FullMovieList(movieList: controller.topRatedMovies),
          ),
        ],
      ),
    );
  }
}
