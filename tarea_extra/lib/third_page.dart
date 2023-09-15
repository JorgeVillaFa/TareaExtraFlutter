import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarea 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop("ʕ•ᴥ•ʔ");
              },
              child: Text("ʕ•ᴥ•ʔ"),
              color: Colors.grey[100],
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop("༼ つ ◕_◕ ༽つ");
              },
              child: Text("༼ つ ◕_◕ ༽つ"),
              color: Colors.grey[100],
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop("(ಥ﹏ಥ)");
              },
              child: Text("(ಥ﹏ಥ)"),
              color: Colors.grey[100],
            ),
          ],
        ),
      ),
    );
  }
}
