import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/decorators/movies_cache_repository_decorator.dart';
import 'package:movie_app/repositories/movies_repository_imp.dart';
import 'package:movie_app/service/dio_service_imp.dart';
import '../models/collection_model.dart';
import '../widgets/custom_list_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    MoviesCacheRepositoryDecorator(
      MoviesRepositoryImp(
        DioServiceImp(),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(28),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            ValueListenableBuilder<Collection?>(
                valueListenable: _controller.collection,
                builder: (_, collection, __) {
                  return Visibility(
                    visible: collection != null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Movies',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.grey.withOpacity(0.05),
                                Colors.grey.withOpacity(0.15),
                                Colors.grey.withOpacity(0.05),
                              ],
                              stops: const [0, 7, 1],
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(children: [
                            Expanded(
                              child: TextField(
                                onChanged: _controller.onChanged,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  fillColor: Colors.white30,
                                  focusColor: Colors.white30,
                                  hoverColor: Colors.white30,
                                ),
                                cursorColor: Colors.white30,
                              ),
                            ),
                          ]),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  );
                }),
            ValueListenableBuilder<Collection?>(
              valueListenable: _controller.collection,
              builder: (_, collection, __) {
                return collection != null
                    ? ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: collection.parts.length,
                        itemBuilder: (_, idx) =>
                            CustomListCardWidget(movie: collection.parts[idx]),
                        separatorBuilder: (_, __) => const Divider(),
                      )
                    : Lottie.asset('assets/lottie.json');
              },
            ),
          ],
        ),
      ),
    ));
  }
}
