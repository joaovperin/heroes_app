import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:heroes_app/domain/heroes/super_hero.dart';
import 'package:heroes_app/domain/heroes/super_hero_repository.dart';
import 'package:heroes_app/infra/conditional_parent_widget.dart';

class MyHomePageRouteArgs {
  const MyHomePageRouteArgs();
}

class MyHomePage extends StatefulWidget {
  static const pageRoute = '/';

  const MyHomePage({Key? key, this.args}) : super(key: key);

  final MyHomePageRouteArgs? args;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _heroesCtrl = StreamController<SuperHero?>.broadcast();

  @override
  initState() {
    super.initState();

    _onPressChangeHero();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heroes App'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<SuperHero?>(
                  stream: _heroesCtrl.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const _LoadingComponent();
                    }
                    if (!snapshot.hasData) {
                      return const Text('No hero selected!');
                    }
                    final hero = snapshot.data!;
                    return _SuperHeroCard(hero: hero);
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _onPressChangeHero,
            tooltip: 'Change Hero',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }

  void _onPressChangeHero() {
    _heroesCtrl.add(null);
    SuperHeroRepository().getRandomHeroFromApi().then((response) {
      _heroesCtrl.add(response);
    });
  }
}

class _SuperHeroCard extends StatelessWidget {
  const _SuperHeroCard({
    Key? key,
    required this.hero,
  }) : super(key: key);

  final SuperHero hero;

  @override
  Widget build(BuildContext context) {
    final bio = hero.biography;
    final imgs = hero.images;
    final stats = hero.powerstats;
    return LayoutBuilder(builder: (context, constraints) {
      return ConditionalParentWidget(
        condition: constraints.maxWidth > 500,
        conditionalBuilder: (child) => Card(
          elevation: 8,
          child: child,
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          constraints: const BoxConstraints(maxWidth: 500, minHeight: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 320,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        '#${hero.id} - ${hero.name}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                  Text(
                    bio.publisher ?? 'Unknown publisher',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              SizedBox(
                height: 240,
                child: CachedNetworkImage(
                  imageUrl: imgs.lg,
                  placeholder: (context, url) => const Center(
                    child: _LoadingComponent(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                // child: FutureBuilder<Uint8List>(
                //   future: ImagesRepository().getImageByUrl(imgs.lg),
                //   builder: (context, snapshot) {
                //     if (!snapshot.hasData ||
                //         snapshot.connectionState == ConnectionState.waiting) {
                //       return const Center(
                //         child: _LoadingComponent(),
                //       );
                //     }
                //     return Image.memory(snapshot.data!);
                //   },
                // ),
              ),
              Text(
                bio.fullName,
                style: Theme.of(context).textTheme.headline6,
              ),
              Card(
                elevation: 8,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  constraints: const BoxConstraints.tightFor(width: 240),
                  child: Column(
                    children: [
                      _HeroStatWidget(
                        label: 'Power',
                        value: stats.power,
                      ),
                      _HeroStatWidget(
                        label: 'Speed',
                        value: stats.speed,
                      ),
                      _HeroStatWidget(
                        label: 'Intelligence',
                        value: stats.intelligence,
                      ),
                      _HeroStatWidget(
                        label: 'Strength',
                        value: stats.strength,
                      ),
                      _HeroStatWidget(
                        label: 'Durability',
                        value: stats.durability,
                      ),
                      _HeroStatWidget(
                        label: 'Combat',
                        value: stats.combat,
                      ),
                      const Divider(),
                      _HeroStatWidget(
                        label: 'Total',
                        value: [
                          stats.combat,
                          stats.durability,
                          stats.intelligence,
                          stats.power,
                          stats.speed,
                          stats.strength
                        ].reduce((a, b) => a + b),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'a.k.a (${bio.aliases.join(", ")})',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _LoadingComponent extends StatelessWidget {
  const _LoadingComponent({
    Key? key,
  }) : super(key: key);

  static const _loadingText = 'Loading...';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 16),
        const Text(_loadingText)
      ],
    );
  }
}

class _HeroStatWidget extends StatelessWidget {
  const _HeroStatWidget({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          value?.toString() ?? '???',
          style: Theme.of(context).textTheme.headline6,
        )
      ],
    );
  }
}
