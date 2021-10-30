import 'dart:async';

import 'package:flutter/material.dart';
import 'package:heroes_app/domain/heroes/super_hero.dart';
import 'package:heroes_app/domain/heroes/super_hero_repository.dart';

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
    final img = hero.image;
    final stats = hero.powerstats;
    return Card(
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(maxWidth: 500, minHeight: 500),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  '#${hero.id} - ${hero.name}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  bio.publisher,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(
              height: 240,
              child: Image.network(img.url),
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
                  ],
                ),
              ),
            ),
            // Text(
            //   bio.alignment,
            //   style: Theme.of(context).textTheme.bodyText1,
            // ),
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
  final String value;

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
          value,
          style: Theme.of(context).textTheme.headline6,
        )
      ],
    );
    // return Text(
    //   '$label: $value',
    //   style: Theme.of(context).textTheme.headline6,
    // );
  }
}
