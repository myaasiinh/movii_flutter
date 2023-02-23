import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MovieApps(),
    );
  }
}

class MovieApps extends StatefulWidget {
  const MovieApps({Key? key}) : super(key: key);

  @override
  State<MovieApps> createState() => _MovieAppsState();
}

class _MovieAppsState extends State<MovieApps> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Movie Apps"),
          backgroundColor: Colors.blue,
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          child: GridView.count(
            controller: ScrollController(keepScrollOffset: false),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            childAspectRatio: (itemWidth / itemHeight),
            children: listmovie,
          ),
        ));
  }

  List<Container> listmovie = [];

  var daftarMovie = [
    {"nama": "Moviee 1", "images": "1.jpg"},
    {"nama": "Moviee 2", "images": "2.jpg"},
    {"nama": "Moviee 3", "images": "3.jpg"},
    {"nama": "Moviee 4", "images": "4.jpg"},
    {"nama": "Moviee 5", "images": "5.jpg"},
    {"nama": "Moviee 6", "images": "6.jpg"},
    {"nama": "Moviee 7", "images": "7.jpg"},
    {"nama": "Moviee 8", "images": "8.jpg"},
    {"nama": "Moviee 9", "images": "9.jpg"},
    {"nama": "Moviee 10", "images": "10.jpg"},
  ];

  @override
  void initState() {
    _buatDataList();
    super.initState();
  }

  _buatDataList() {
    for (var i = 0; i < daftarMovie.length; i++) {
      final listMovienya = daftarMovie[i];
      final String? image = listMovienya['images'];

      listmovie.add(Container(
        padding: new EdgeInsets.all(20.0),
        child: Card(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailMovieApps(
                          nama: listMovienya['nama']!,
                          images: listMovienya['images']!)));
            },
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10.0)),
                Hero(
                    tag: listMovienya['nama'] ?? "",
                    child: Image.asset(
                      "gambar/$image",
                      height: 100.0,
                      width: 100.0,
                      fit: BoxFit.cover,
                    )),
                const Padding(padding: EdgeInsets.all(10.0)),
                Text(
                  listMovienya['nama']!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ],
            ),
          ),
        ),
      ));
    }
  }
}

class DetailMovieApps extends StatelessWidget {
  const DetailMovieApps({required this.nama, required this.images});

  final String nama;
  final String images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: Hero(
              tag: nama,
              child: Material(
                child: InkWell(
                  child: Image.asset(
                    "gambar/$images",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          BagianNama(
            nama: nama,
          ),
          BagianIcon(),
          BagianKeterangan(),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({required this.nama});

  final String nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(nama,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.blue)),
                Text(
                  "$nama\@gmail.com",
                  style: TextStyle(fontSize: 18.0, color: Colors.blue),
                )
              ],
            ),
          ),
          new Row(children: <Widget>[
            Icon(Icons.star, color: Colors.yellow),
            Text(
              "12",
              style: TextStyle(fontSize: 18.0, color: Colors.blue),
            ),
          ])
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const <Widget>[
          IconTeks(
            iconData: Icons.call,
            teks: "CALL",
          ),
          IconTeks(
            iconData: Icons.message,
            teks: "MESSAGE",
          ),
          IconTeks(
            iconData: Icons.email,
            teks: "EMAIL",
          ),
          IconTeks(
            iconData: Icons.photo,
            teks: "EMAIL",
          ),
        ],
      ),
    );
  }
}

class IconTeks extends StatelessWidget {
  const IconTeks({@required this.iconData, @required this.teks});

  final IconData? iconData;
  final String? teks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(
            iconData,
            size: 50.0,
            color: Colors.blue,
          ),
          Text(
            teks!,
            style: const TextStyle(fontSize: 18.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class BagianKeterangan extends StatelessWidget {
  const BagianKeterangan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            style: TextStyle(fontSize: 18.0, color: Colors.blue),
              textAlign: TextAlign.justify,
            ),

          ),

        ));
  }
}
