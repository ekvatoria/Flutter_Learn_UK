import 'package:flutter/material.dart';

class ButtonLearnView extends StatelessWidget {
  const ButtonLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        TextButton(
          onPressed: () {},
          style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.green;
            } else {
              return Colors.black;
            }
          })),
          child: Text("TextButton", style: Theme.of(context).textTheme.bodySmall),
        ),
        const ElevatedButton(onPressed: null, child: Text("ElevatedButton")),
        IconButton(onPressed: () {}, icon: const Icon(Icons.abc)),
        FloatingActionButton(
            onPressed: () {
              // servise istek at
              // sayfanın rengini düzenle
            },
            child: const Icon(Icons.ac_unit)),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
              backgroundColor: Colors.red,
              //shape: const CircleBorder(),
              padding: const EdgeInsets.all(10)),
          child: const SizedBox(width: 200, child: Text("Outlined")),
        ),
        OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.abc), label: const Text("OutlinedIcon")),
        //DrawerButton(onPressed: () {}),
        //FilledButton(onPressed: () {}, child: const Text("data")),
        //SubmenuButton(menuChildren: [], child: Text("Submenu")),
        //MaterialButton(onPressed: () {}, child: const Text("Material")),
        //CupertinoButton(onPressed: () {}, child: const Text("Cupertino")),
        //RawMaterialButton(onPressed: () {},child: const Text("RawMaterial")),
        InkWell(onTap: () {}, child: const Text("Inkwell")),
        Container(
          height: 200,
          color: Colors.white,
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 20, left: 40, right: 40),
              child: Text(
                "Place Bid",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ))
      ]),
    );
  }
}


//Borders
// CircleBorder(), RoundedRectangleBorder()



