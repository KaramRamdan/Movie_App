import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/core/utils/app_string.dart';
import 'package:movie_app/movie/presentation/components/now_playing_component.dart';
import 'package:movie_app/movie/presentation/components/popular_component.dart';
import 'package:movie_app/movie/presentation/components/top_rated_component.dart';
import 'package:movie_app/movie/presentation/controller/movies_bloc.dart';
import 'package:movie_app/movie/presentation/controller/movies_events.dart';
import 'package:movie_app/movie/presentation/screens/popular_movie_screen.dart';
import 'package:movie_app/movie/presentation/screens/top_rated_movie_screen.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<MovieBloc>()
        ..add(GetNowPlayingMovieEvent())
        ..add(GetPopularMovieEvent())
        ..add(GetTopRatedMovieEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.popular,
                      style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                              const PopularMovieScreen(),
                            ));
                        /// TODO : NAVIGATION TO POPULAR SCREEN
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(
                              AppString.seeMore,
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                size: 16.0, color: Colors.white)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.topRated,
                      style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                              const TopRatedMovieScreen(),
                            ));
                        /// TODO : NAVIGATION TO Top Rated Movies Screen
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(
                              AppString.seeMore,
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                size: 16.0, color: Colors.white)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRatedComponent(),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
