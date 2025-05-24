import 'package:flutter/material.dart';
import 'package:pasing_data/model/model_users.dart';

class DetailUserView extends StatelessWidget {
  final ModelUsers user;

  const DetailUserView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('👤Username: ${user.username}', style: TextStyle(fontSize: 16)),
            Text('Email: ${user.email}'),
            Text('Phone: ${user.phone}'),
            Text('Website: ${user.website}'),
            const SizedBox(height: 10),
            Text('📍Address:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('${user.address.street}, ${user.address.suite}'),
            Text('${user.address.city}, ${user.address.zipcode}'),
            Text('Geo: ${user.address.geo.lat}, ${user.address.geo.lng}'),
            const SizedBox(height: 10),
            Text('🏛️ Company:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(user.company.name),
            Text(user.company.catchPhrase),
            Text(user.company.bs),
          ],
        ),
      ),
    );
  }
}
