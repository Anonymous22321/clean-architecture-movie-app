import 'package:clean_architecture_and_solid_principles/movie%20app/movies/presentation/components/rebuilding%20components/now_playing_component.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/movies/presentation/components/rebuilding%20components/top_rated_component.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/movies/presentation/components/static%20components/list_title_component.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/movies/presentation/screens/popular_movies_full_List.dart';
import 'package:clean_architecture_and_solid_principles/movie%20app/movies/presentation/screens/top_rated_movies_full_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/rebuilding components/popular_component.dart';
import '../controller/movie_controller.dart';

class MoviesScreen extends GetView<MovieController> {
  // const MoviesScreen({Key? key}) : super(key: key);
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                key: const Key('movieScrollView'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Method in package animate_do for animation
                    const NowPlayingComponent(),
                    ListTitleComponent(title: "Popular", onTap: () => Get.to(()=> const PopularMoviesFullList())),
                    const PopularComponent(),
                    ListTitleComponent(title: "Top Rated", onTap: ()=> Get.to(()=> const TopRatedMoviesFullList())),
                    const TopRatedComponent(),
                    const SizedBox(height: 50.0),
                  ],
                ),
              ),
            ),
          );
  }
}
