import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Cambiar luego por una instancia de la clase Movie
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return const Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

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
            alignment: Alignment.bottomCenter,
            child:
                const Text('movie.title', style: const TextStyle(fontSize: 16)),
          ),
          background: const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage('https://via.placeholder.com/500x300'),
            fit: BoxFit.cover,
          )),
    );
  }
}
