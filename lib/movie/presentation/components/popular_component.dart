import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/network/api_constance.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movie/presentation/controller/movies_bloc.dart';
import 'package:movie_app/movie/presentation/controller/movies_states.dart';
import 'package:movie_app/movie/presentation/screens/movie_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.popularState != current.popularState,
      builder: (context, state) {
        switch (state.popularState) {
          case RequestState.loading:
            return const SizedBox(
              height: 170.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.popularMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.popularMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right:10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    MovieDetailScreen(id: movie.id),
                              ));
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                        },
                        child: Column(
                          children: [
                            Stack(  alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                                  child: CachedNetworkImage(
                                    width: 120.0,
                                    height: 170.0,
                                    fit: BoxFit.cover,
                                    imageUrl: ApiConstance.imageUrl(movie.backdropPath),
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
                                    errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                  ),
                                ),
                                Container(
                                  width: 118,
                                  color: Colors.black.withOpacity(.5),
                                  child: Text(
                                    movie.title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ) ;
          case RequestState.error:
            return SizedBox(
              height: 170.0,
              child: Center(
                child: Text(state.popularMessage),
              ),
            );
        }

      },
    );
  }
}
