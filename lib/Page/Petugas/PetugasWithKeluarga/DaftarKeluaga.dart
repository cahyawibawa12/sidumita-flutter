import 'package:flutter/material.dart';
import 'package:focus_detector_v2/focus_detector_v2.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/PetugasController.dart';
import 'package:posyandu/Page/LoginPeserta/RegisterPeserta.dart';
import 'package:posyandu/Page/Petugas/PemeriksaanIbuHamil/RiwayatPemeriksaanIbuHamil.dart';
import 'package:posyandu/Page/Petugas/PetugasWithKeluarga/AnggotaKeluarga.dart';
import 'package:posyandu/Page/Petugas/PetugasWithKeluarga/TambahKeluarga.dart';
import 'package:posyandu/widget/BackgroundImage.dart';

class DaftarKeluarga extends StatefulWidget {
  const DaftarKeluarga({super.key});

  @override
  State<DaftarKeluarga> createState() => _DaftarKeluargaState();
}

class _DaftarKeluargaState extends State<DaftarKeluarga> {
  var petugasWithKeluarga = Get.put(PetugasController());

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    petugasWithKeluarga.showKeluargaForPetugas().then((value) {
      _foundUsers = petugasWithKeluarga.data;
    });

    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = petugasWithKeluarga.data;
    } else {
      results = petugasWithKeluarga.data
          .where((user) => user["kepala_keluarga"]
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
    return FocusDetector(
      onFocusGained: () {
        petugasWithKeluarga.showKeluargaForPetugas().then((value) {
          _foundUsers = petugasWithKeluarga.data;
        });
      },
      child: Stack(
        children: [
          BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text("Daftar Keluarga"),
              backgroundColor: Color(0xff34BE82),
            ),
            body: SafeArea(
              child: Obx(() => petugasWithKeluarga.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            height: 64,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(12.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterPesertabyPetugas()));
                              },
                              child: const Text("Tambah Keluarga"),
                            ),
                          ),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(25.0)))),
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
                                        title: Text(_foundUsers[index]
                                            ['kepala_keluarga']),
                                        subtitle: Text(
                                            '${_foundUsers[index]["no_kartu_keluarga"].toString()}'),
                                        trailing: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.green[700],
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Text(
                                            _foundUsers[index]['nama_dusun'],
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AnggotaKeluarga(
                                                        petugasWithKeluargaModel:
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
      ),
    );
  }
}
