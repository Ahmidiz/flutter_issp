import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:issp_app/admin/client.dart';
import 'package:issp_app/admin/users.dart';
import 'package:issp_app/user/task_form.dart';
import 'package:issp_app/user/user_profile.dart';

class AdminHomePage extends StatefulWidget {
  final Map<String, dynamic> userDetails;

  const AdminHomePage({Key? key, required this.userDetails}) : super(key: key);

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.red],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.person), text: 'Users'),
              Tab(icon: Icon(Icons.business), text: 'Clients'),
              Tab(icon: Icon(Icons.assignment_late), text: 'Tasks'),
            ],
          ),
          elevation: 20,
          titleSpacing: 20,
        ),
        backgroundColor: const Color.fromARGB(255, 247, 250, 255),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });

            if (index == 0) {
              // Navigate to the UsersTabContent page
              // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => UsersTabContent()));
            } else if (index == 1) {
              // Navigate to the Feed page
              // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => buildPage('Feed Page')));
            } else if (index == 2) {
              // Navigate to the UserProfileScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfileScreen(
                    userDetails: widget.userDetails,
                  ),
                ),
              );
            }
          },
        ),
        body: TabBarView(
          children: [
            buildImageSlider(), // Replaced 'Feed Page' with image slider
            UsersTabContent(),
            ClientsTabContent(),
            TaskFormPage(),
          ],
        ),
      ),
    );
  }

  Widget buildImageSlider() => CarouselSlider(
        items: [
          // Add your image widgets here
          Image.asset('assets/images/p1.jpg'),
          Image.asset('assets/images/p2.jpg'),
          Image.asset('assets/images/p3.jpg'),
        ],
        options: CarouselOptions(
          height: 200,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
      );
}
