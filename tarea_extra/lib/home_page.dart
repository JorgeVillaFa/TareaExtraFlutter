import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarea_extra/second_page.dart';
import 'package:tarea_extra/third_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String enteredTextPg2 = '';
  String pg2_Return = '';
  String pg3_Return = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarea 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Bienvenidos",
              style: TextStyle(
                fontFamily: 'DancingScript',
                fontSize: 42,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
            Image.asset("assets/images/homeImage.png"),
            Text(
              "Seleccione la accion a realizar:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    _Page2();
                  },
                  child: Text("Pagina 2"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(18),
                ),
                MaterialButton(
                  onPressed: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ThirdPage(),
                      ),
                    );
                    setP3Text(result);
                  },
                  child: Text("Pagina 3"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(18),
                ),
              ],
            ),
            Text("Pg.2 => ${pg2_Return}"),
            Text("Pg.3 => ${pg3_Return}"),
          ],
        ),
      ),
    );
  }

  void _Page2() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: StatefulBuilder(
            builder: (BuildContext context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ingrese Datos",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: TextField(
                      onChanged: (val) {
                        enteredTextPg2 = val;
                        setState(() {});
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      decoration: InputDecoration(
                          counterText: '${getStringLenght()}/10',
                          hintText: "Ingrese Palabra"),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancelar"),
                      ),
                      MaterialButton(
                        onPressed: () async {
                          final result = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SecondPage(),
                            ),
                          );
                          setP2Text(result);
                        },
                        child: Text("Aceptar"),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }

  void setP2Text(data) {
    pg2_Return = enteredTextPg2 + data.toString();
    setState(() {});
  }

  void setP3Text(data) {
    pg3_Return = data.toString();
    setState(() {});
  }

  String getStringLenght() {
    return enteredTextPg2.length.toString();
  }
}
