import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home());
  }
}

List<String> titles = ['safa', 'basheer', 'ahamed'];
List<String> favs = [];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Favorite()));
        },
        child: const Icon(Icons.skip_next),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemBuilder: ((context, index) {
          return ListTile(
            title: Text(titles[index]),
            trailing: IconButton(
                onPressed: (() {
                  setState(() {
                    favs.add(titles[index]);
                    const snackBar =
                        SnackBar(content: Text('Added to favorite'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                }),
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )),
          );
        }),
        itemCount: titles.length,
      )),
    );
  }
}

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: favs.isEmpty
              ? const Center(child: Text('No favs'))
              : ListView.builder(
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text(favs[index]),
                      trailing: IconButton(
                          onPressed: (() {
                            setState(() {
                              favs.remove(favs[index]);
                            });
                          }),
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    );
                  }),
                  itemCount: favs.length,
                )),
    );
  }
}
