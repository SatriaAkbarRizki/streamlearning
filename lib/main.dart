import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeApp> {
  Stream showImage() async* {
    await Future.delayed(Duration(seconds: 1));
    yield ListImage(0);

    await Future.delayed(Duration(seconds: 2));
    yield ListImage(1);

    await Future.delayed(Duration(seconds: 3));
    yield ListImage(2);

    await Future.delayed(Duration(seconds: 4));
    yield ListImage(3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: showImage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.hasData) {
              return Container(
                width: 240.0,
                height: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(snapshot.data)),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              );
            }

            return Container(
              child: Text('Done'),
            );
          },
        ),
      ),
    );
  }

  String? ListImage(int index) {
    var imageLink = <String>{};
    imageLink.add(
        "https://images.unsplash.com/photo-1679649995776-11e713cdeee9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=373&q=80");
    imageLink.add(
        "https://images.unsplash.com/photo-1679572125292-d01c28de06ca?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE0fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60");
    imageLink.add(
        "https://plus.unsplash.com/premium_photo-1669050702401-bdd843df1830?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE2fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60");

    return imageLink.elementAtOrNull(index);
  }
}
