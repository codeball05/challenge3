import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
              onSelectAll: (b) {},
              columnSpacing: 30,
              sortAscending: true,
              sortColumnIndex: 0,
              columns: <DataColumn>[
                DataColumn(
                    label: Text("# ID"),
                    numeric: true,
                    onSort: (i, b) {
                      setState(() {
                        pokemons.sort((a, b) => a.id.compareTo(b.id));
                      });
                    }),
                DataColumn(
                    label: Text("Nombre"),
                    numeric: false,
                    onSort: (i, b) {
                      setState(() {
                        pokemons.sort((a, b) => a.name.compareTo(b.name));
                      });
                    }),
                DataColumn(
                    label: Text("Tipo"),
                    numeric: false,
                    onSort: (i, b) {
                      setState(() {
                        pokemons.sort((a, b) => a.type.compareTo(b.type));
                      });
                    }),
                DataColumn(
                    label: Text("Poder"),
                    numeric: true,
                    onSort: (i, b) {
                      setState(() {
                        pokemons.sort((a, b) => a.power.compareTo(b.power));
                      });
                    }),
                DataColumn(
                    label: Text("Cant. Evoluciones"),
                    numeric: true,
                    onSort: (i, b) {
                      setState(() {
                        pokemons.sort((a, b) =>
                            a.cantEvolution.compareTo(b.cantEvolution));
                      });
                    }),
              ],
              rows: pokemons
                  .map((item) => DataRow(cells: [
                        DataCell(Text(item.id.toString())),
                        DataCell(Text(item.name.toString())),
                        DataCell(Text(item.type.toString())),
                        DataCell(Text(item.power.toString())),
                        DataCell(Text(item.cantEvolution.toString())),
                      ]))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class Pokemon {
  int id;
  String name;
  String type;
  int power;
  int cantEvolution;

  Pokemon(
      {required this.id,
      required this.name,
      required this.type,
      required this.power,
      required this.cantEvolution});
}

var pokemons = <Pokemon>[
  Pokemon(
      id: 1, name: "Pikachu", type: "Electrico", power: 100, cantEvolution: 2),
  Pokemon(id: 2, name: "Squirtle", type: "Agua", power: 100, cantEvolution: 3),
  Pokemon(
      id: 3, name: "Charmander", type: "Fuego", power: 100, cantEvolution: 3),
  Pokemon(
      id: 4, name: "Bulbasaur", type: "Planta", power: 100, cantEvolution: 3),
];
