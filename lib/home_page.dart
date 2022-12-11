import 'dart:convert';
import 'dart:developer';

import 'package:fetch_userdetails/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> userList = [];

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  fetchUser() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      final decodedResponse = jsonDecode(response.body) as List;
      final users = decodedResponse.map((e) => User.fromJson(e)).toList();
      userList = users;
      setState(() {});
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User details"),
      ),
      body: ListView.separated(
          itemCount: userList.length,
          padding: EdgeInsets.all(10),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemBuilder: (context, int index) {
            return Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 228, 225, 225),
                  border: Border.all(width: 0),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userList[index].name,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(userList[index].address.street),
                  Text(userList[index].phoneNumber),
                  Text(userList[index].email),
                ],
              ),
            );
          }),
    );
  }
}
