import 'package:flutter/material.dart';
import 'package:flutter_exam_2/models/user.dart';
import 'package:flutter_exam_2/services/user_services.dart';

class HomePageStateful extends StatefulWidget {
  const HomePageStateful({super.key});

  @override
  State<HomePageStateful> createState() => _HomePageStatefulState();
}

class _HomePageStatefulState extends State<HomePageStateful> {
  List<User> users = [];

  void fetchUsers() async {
    final result = await UserService.fetchUsers();
    setState(() {
      users = result;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.get_app), 
            SizedBox(width: 10),
            Text('EXAM REST API AND JSON GET LABIB'),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 152, 200, 207), // Matching color with MainScreen
      ),
      body: users.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  child: ListTile(
                    leading: user.profile_image != null && user.profile_image.isNotEmpty
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(user.profile_image),
                          )
                        : CircleAvatar(
                            child: Icon(Icons.person), 
                          ),
                    title: Text(user.employee_name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Age: ${user.employee_age}'),
                        Text('Salary: \$${user.employee_salary}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
