// this is a screen that allows the publisher to decide whether to read or publish

import 'package:flutter/material.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

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
                      const Text('Welcome, USER',
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
                            backgroundColor: Color.fromARGB(230, 15, 170, 108),
                          ),
                          child: const Text('Task')),
                      const SizedBox(
                        height: 60,
                      ),
                      OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              fixedSize: const Size(300, 60),
                              backgroundColor:
                                  Color.fromARGB(231, 11, 156, 127)),
                          child: const Text('Feedback')),
                    ]),
                  ))),
        ));
  }
}
