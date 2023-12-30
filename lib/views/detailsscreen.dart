import 'package:codememachinetest/controllers/details_controler.dart';
import 'package:codememachinetest/models/usermodel.dart';

import 'package:flutter/material.dart';


import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final obj = Provider.of<DetailsController>(context);

    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          title: const Text("Lead List"),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: FutureBuilder<UserModel>(
            future: obj.fetchLeadList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    backgroundColor: Colors.black,
                  ),
                );
              }
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.data!.leads!.length,
                    itemBuilder: (context, index) {
                      Leads list = snapshot.data!.data!.leads![index];

                      return Card(
                        surfaceTintColor: Colors.white,
                        color: Colors.white,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            child: Center(child: Text(list.id.toString())),
                          ),
                          title: Text(list.createdUser!),
                          subtitle: Column(
                            children: [
                              Row(
                                children: [
                                  Text(list.assignedUser!),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(list.email!),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(list.mobile!),
                                ],
                              ),
                            ],
                          ),
                          trailing: Column(children: [
                            Text(list.location!),
                            const SizedBox(
                              height: 5,
                            ),
                            Expanded(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.phone,
                                      color: Colors.green,
                                    )))
                          ]),
                        ),
                      );
                    });
              } else {
                return const SizedBox();
              }
            }));
  }
}
