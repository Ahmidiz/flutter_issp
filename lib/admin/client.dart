import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:issp_app/admin/adding_client.dart';

class ClientsPage extends StatefulWidget {
  @override
  _ClientsPageState createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  late TextEditingController searchController;

  Future<List<Client>> fetchClients() async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2/isspclients.php'),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      List<Client> clients =
          jsonList.map((model) => Client.fromJson(model)).toList();
      return clients;
    } else {
      throw Exception('Failed to load clients');
    }
  }

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 250, 255),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      height: 40.0,
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          labelText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onChanged: (value) {
                          // Add your search logic here
                          print('Search Query: $value');
                        },
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddClientPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(16.0),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 20.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Client>>(
              future: fetchClients(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  List<Client>? clients = snapshot.data;

                  return ListView.builder(
                    itemCount: clients?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // You can navigate to a detailed client page if needed
                        },
                        child: ClientsContainer(client: clients![index]),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Client {
  final String clientName;
  final String projectName;
  final String projectDescription;

  Client({
    required this.clientName,
    required this.projectName,
    required this.projectDescription,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      clientName: json['clientName'] ?? '',
      projectName: json['projectName'] ?? '',
      projectDescription: json['projectDescription'] ?? '',
    );
  }
}

class ClientsContainer extends StatelessWidget {
  final Client client;

  const ClientsContainer({required this.client});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      margin: EdgeInsets.all(15.0),
      padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 247, 250, 255),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color.fromARGB(231, 204, 184, 179)),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              shape: BoxShape.rectangle,
              // Here, you can display an image related to the client if available
              color: Colors.grey, // Placeholder color
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Client: ${client.clientName}',
                    style: GoogleFonts.rufina(
                      color: const Color.fromARGB(255, 129, 38, 8),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
                Text('Project: ${client.projectName}',
                    style: GoogleFonts.aBeeZee(
                      color: Color.fromARGB(255, 23, 22, 22),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                Text('Description: ${client.projectDescription}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
