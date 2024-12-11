import 'package:flutter/material.dart';

import '../../models/user/user_model.dart';



class UsersScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(id: 1, name: 'Spider-man', phone: '444444444444444444'),
    UserModel(id: 2, name: 'Venom', phone: '55555555555555'),
    UserModel(id: 3, name: 'Peter Parker', phone: '2222222'),
    UserModel(id: 4, name: 'Buggy Bunny', phone: '33333'),
    UserModel(id: 5, name: 'Joker', phone: '111111111111'),
    UserModel(id: 1, name: 'Spider-man', phone: '444444444444444444'),
    UserModel(id: 2, name: 'Venom', phone: '55555555555555'),
    UserModel(id: 3, name: 'Peter Parker', phone: '2222222'),
    UserModel(id: 4, name: 'Buggy Bunny', phone: '33333'),
    UserModel(id: 5, name: 'Joker', phone: '111111111111'),
    UserModel(id: 1, name: 'Spider-man', phone: '444444444444444444'),
    UserModel(id: 2, name: 'Venom', phone: '55555555555555'),
    UserModel(id: 3, name: 'Peter Parker', phone: '2222222'),
    UserModel(id: 4, name: 'Buggy Bunny', phone: '33333'),
    UserModel(id: 5, name: 'Joker', phone: '111111111111'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(users[index]),
        separatorBuilder: (context, index) =>
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 20),
              child: Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey[300],
              ),
            ),
        itemCount: users.length,),);
  }

  Widget buildUserItem(UserModel users) =>
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 25,
              child: Text(
                '${users.id}',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  users.name,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  users.phone,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
