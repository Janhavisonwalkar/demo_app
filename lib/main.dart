import 'package:flutter/material.dart';

import 'model/movie_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>{
  static List<DataModel> movieList = [
    DataModel("Vijay", 123, "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=600", 4.5),
    DataModel("Singh", 124, "https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?auto=compress&cs=tinysrgb&w=600", 4.9),
    DataModel("Rathore", 125, "https://images.pexels.com/photos/1133957/pexels-photo-1133957.jpeg?auto=compress&cs=tinysrgb&w=600", 5.0),
    DataModel("Sanjay", 126, "https://images.pexels.com/photos/757889/pexels-photo-757889.jpeg?auto=compress&cs=tinysrgb&w=600", 5.0),

    DataModel("Chaitanya", 127, "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=600", 4.5),
    DataModel("Sajay", 128, "https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?auto=compress&cs=tinysrgb&w=600", 4.9),
    DataModel("Ajay", 129, "https://images.pexels.com/photos/1133957/pexels-photo-1133957.jpeg?auto=compress&cs=tinysrgb&w=600", 5.0),
    DataModel("Abhay", 130, "https://images.pexels.com/photos/757889/pexels-photo-757889.jpeg?auto=compress&cs=tinysrgb&w=600", 5.0),

    DataModel("Aryan", 131, "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=600", 4.5),
    DataModel("Dinesh", 132, "https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?auto=compress&cs=tinysrgb&w=600", 4.9),
    DataModel("Mukesh", 133, "https://images.pexels.com/photos/1133957/pexels-photo-1133957.jpeg?auto=compress&cs=tinysrgb&w=600", 5.0),
    DataModel("Ramesh", 134, "https://images.pexels.com/photos/757889/pexels-photo-757889.jpeg?auto=compress&cs=tinysrgb&w=600", 5.0)

  ];

  List<DataModel> displayList = List.from(movieList);
  void updateList(String value) {
    setState(() {
      displayList = movieList.where((item) => item.title!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1f1545),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Search for Movie", style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold,
          )
            ,),
          const SizedBox(height: 20.0,
          ),
          TextField(
            onChanged: (value) => updateList(value),
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xff302360),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none
              ),
              hintText: "eg. The Dark Night",
              prefixIcon: const Icon(Icons.search),
              prefixIconColor: Colors.purple.shade900
            ),
          ),
          const SizedBox(height: 20.0,),
          Expanded(child: ListView.builder(
            itemCount: displayList.length,
            itemBuilder: (context, i) => ListTile(
              contentPadding: const EdgeInsets.all(8.0),
              title: Text(displayList[i].title!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              subtitle: Text('${displayList[i].serialNumber!}', style: const TextStyle(color: Colors.white60),),
              //trailing: Text("${dispay_list[i].rating}", style: TextStyle(color: Colors.amber),),
              //leading: Image.network(dispay_list[i].movie_poster_url!),
            ),)),
        ],),
      ),
    );
  }
}

