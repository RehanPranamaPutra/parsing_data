import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pasing_data/model/model_users.dart';
import 'package:pasing_data/uiview/detail_list_user.dart';

class ListUserView extends StatefulWidget {
  const ListUserView({super.key});

  @override
  State<ListUserView> createState() => _ListUserViewState();
}

class _ListUserViewState extends State<ListUserView> {
  bool isLoading = false;
  List<ModelUsers> listUsers = [];

  Future getUser() async {
    try {
      //kondisi berhasil
      setState(() {
        isLoading = true;
      });

      http.Response res = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
      );
      var data = res.body;

      setState(() {
        var decodedData = jsonDecode(data);
        for (var i in decodedData) {
          listUsers.add(ModelUsers.fromJson(i));
        }
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List User')),
      body: ListView.builder(
        itemCount: listUsers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 8, left: 8, right: 8),
            child: ListTile(
              title: Text(
                listUsers[index].name ?? "",

                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(listUsers[index].username ?? ""),
                  Text(listUsers[index].email ?? ""),
                  Text(listUsers[index].address.city ?? ""),

                  //string dalam string
                  Text("Email :" + listUsers[index].email),
                  Text("Company ${listUsers[index].company.name}"),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailUserView(user: listUsers[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
