// this is a screen that allows the publisher to decide whether to read or publish

import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 250, 255),
        body: Center(
          child: Container(
              margin: const EdgeInsets.all(40),
              child: SizedBox(
                  height: 800,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text('Welcome, ADMIN',
                          style: TextStyle(
                              color: Color.fromARGB(255, 14, 15, 14),
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      const SizedBox(
                        height: 200,
                      ),
                      OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            fixedSize: const Size(300, 60),
                            backgroundColor:
                                const Color.fromRGBO(181, 48, 13, 25),
                          ),
                          child: const Text('User')),
                      const SizedBox(
                        height: 60,
                      ),
                      OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              fixedSize: const Size(300, 60),
                              backgroundColor:
                                  const Color.fromRGBO(181, 48, 13, 25)),
                          child: const Text('Client')),
                    ]),
                  ))),
        ));
  }
}
