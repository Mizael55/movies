import 'package:flutter/material.dart';
import 'package:movies/widget/casting_card.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Cambiar luego por una instancia de la clase Movie
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
        SliverList(
          delegate: SliverChildListDelegate([
            _PosterAndTitle(),
            _OverView(),
            _OverView(),
            _OverView(),
            CastingCards(),
          ]),
        )
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          titlePadding: const EdgeInsets.all(0),
          centerTitle: true,
          title: Container(
            width: double.infinity,
            color: Colors.black12,
            padding: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.bottomCenter,
            child: const Text('movie.title', style: TextStyle(fontSize: 16)),
          ),
          background: const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage('https://via.placeholder.com/500x300'),
            fit: BoxFit.cover,
          )),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'movie.title',
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'movie.originaTitle',
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  const Icon(Icons.star_outline, size: 15, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    'movie.voteAverage',
                    style: textTheme.caption,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Text(
            'Aliquip ipsum consectetur tempor amet eiusmod irure qui aute. Et ipsum irure exercitation proident qui qui incididunt reprehenderit id. Ad in in Lorem consectetur in reprehenderit elit adipisicing qui labore. Lorem proident sunt nisi elit sda dfs sdfsd cupidatat qui ea.',
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.subtitle1));
  }
}
