import 'dart:convert';

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:issp_app/admin/adding_client.dart';
import 'package:issp_app/admin/manage_user.dart';

class ClientsTabContent extends StatefulWidget {
  @override
  _ClientsTabContentState createState() => _ClientsTabContentState();
}

class _ClientsTabContentState extends State<ClientsTabContent> {
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
                PopupMenuButton<String>(
                  icon: Icon(Icons.more_vert),
                  onSelected: (value) {
                    if (value == 'adduser') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddClientPage(),
                        ),
                      );
                    } else if (value == 'refreshscreen') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClientsTabContent(),
                        ),
                      );
                      // Implement refresh screen logic here
                      print('Refresh Screen');
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return {'Add User', 'Refresh Screen'}.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice.toLowerCase().replaceAll(' ', ''),
                        child: Text(choice),
                      );
                    }).toList();
                  },
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ClientDetailsPage(client: clients[index]),
                              ),
                            );
                          },
                          child: ClientContainer(
                            client: clients![index],
                            pressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ClientDetailsPage(client: clients[index]),
                                ),
                              );
                            },
                          ));
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

class ClientContainer extends StatefulWidget {
  final Client client;
  final VoidCallback pressed; // Change the type to VoidCallback

  const ClientContainer({required this.client, required this.pressed});

  @override
  _ClientContainerState createState() => _ClientContainerState();
}

class _ClientContainerState extends State<ClientContainer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        height: isExpanded ? 300 : 90, // Adjust the expanded height
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
              width: 80, // Adjust the width based on your design
              height: 80, // Adjust the height based on your design
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage('assetName'),
                  /* MemoryImage(
                    base64Decode(widget.client.propic),
                  ),*/
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.client.clientName}',
                    style: GoogleFonts.rufina(
                      color: const Color.fromARGB(255, 129, 38, 8),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${widget.client.projectName}',
                    style: GoogleFonts.aBeeZee(
                      color: Color.fromARGB(255, 23, 22, 22),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (isExpanded) // Additional widgets when expanded
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${widget.client.projectDescription}'),
                        IconButton(
                          icon: Icon(Icons.person),
                          onPressed: widget.pressed,
                          style: ButtonStyle(),
                          // Use the passed callback
                        ),
                        Text('Manage User'),
                        IconButton(
                          icon: Icon(Icons.assignment),
                          onPressed: widget.pressed,
                          style: ButtonStyle(),
                          // Use the passed callback
                        ),
                        Text('View Log Activities'),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: widget.pressed,
                          style: ButtonStyle(),
                          // Use the passed callback
                        ),
                        Text('Remove User'),

                        // Add more widgets as needed
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClientsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClientsTabContent();
  }
}
