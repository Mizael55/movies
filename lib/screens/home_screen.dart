import 'package:flutter/material.dart';
import 'package:movies/widget/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Movies available'),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              /// Tarjeta principal con la imagen y el texto
              CardSwiper(),

              /// Slider de peliculas populares y recomendadas
              MovieSlider(),
            ],
          ),
        ));
  }
}
