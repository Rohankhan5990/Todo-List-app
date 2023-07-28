import 'package:flutter/material.dart';
import '../design/fi_a3_rohan_iconbox.dart';
import '../services/read.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({super.key});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 500,
          child: StreamBuilder(
            stream: UserProvider.fetchUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                final users = snapshot.data!.docs.reversed.toList();
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final userid = users[index].data();
                    final userid1 = users[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        child: ListTile(
                          title: Text(
                            userid['task'],
                          ),
                          leading: Text('${index + 1}'),
                          trailing: InkWell(
                            onTap: () {},
                            child: SizedBox(
                              width: 80,
                              child: IconBox(data: userid1.id),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('No data found.'),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
