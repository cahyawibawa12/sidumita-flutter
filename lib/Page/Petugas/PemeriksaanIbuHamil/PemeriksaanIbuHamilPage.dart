import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/PetugasController.dart';
import 'package:posyandu/Page/Petugas/PemeriksaanIbuHamil/RiwayatPemeriksaanIbuHamil.dart';
import 'package:posyandu/widget/BackgroundImage.dart';

class PemeriksaanIbuHamilPage extends StatefulWidget {
  const PemeriksaanIbuHamilPage({super.key});

  @override
  State<PemeriksaanIbuHamilPage> createState() =>
      _PemeriksaanIbuHamilPageState();
}

class _PemeriksaanIbuHamilPageState extends State<PemeriksaanIbuHamilPage> {
  var petugasWithIbuHamil = Get.put(PetugasController());

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    petugasWithIbuHamil.showIbuHamilForPetugas().then((value) {
      _foundUsers = petugasWithIbuHamil.data;
    });

    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = petugasWithIbuHamil.data;
    } else {
      results = petugasWithIbuHamil.data
          .where((user) => user["nama_lengkap"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Pemeriksaan Ibu Hamil"),
            backgroundColor: Color(0xff34BE82),
          ),
          body: SafeArea(
            child: Obx(() => petugasWithIbuHamil.isLoading.value
                ? CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          onChanged: (value) => _runFilter(value),
                          decoration: InputDecoration(
                              labelText: "Search",
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: _foundUsers.isNotEmpty
                              ? ListView.builder(
                                  itemCount: _foundUsers.length,
                                  itemBuilder: (context, index) => Card(
                                    key: ValueKey(_foundUsers[index]["id"]),
                                    color: Color.fromARGB(255, 112, 232, 124),
                                    elevation: 4,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: ListTile(
                                      // leading: Text(
                                      //   _foundUsers[index]["id"].toString(),
                                      //   style: const TextStyle(fontSize: 24),
                                      // ),
                                      title: Text(
                                          _foundUsers[index]['nama_lengkap']),
                                      subtitle: Text(
                                          '${_foundUsers[index]["nama_dusun"].toString()}'),
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RiwayatPemeriksaanIbuHamil(
                                                      petugasWithIbuHamilModel:
                                                          _foundUsers[index],
                                                    )));
                                      },
                                    ),
                                  ),
                                )
                              : const Text(
                                  'No results found',
                                  style: TextStyle(fontSize: 24),
                                ),
                        ),
                      ],
                    ),
                  )),
          ),
        )
      ],
    );
  }
}
