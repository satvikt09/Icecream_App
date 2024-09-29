// ignore_for_file: prefer_const_constructors

import 'package:app/icecream/icecream.dart';
import 'package:app/icecream/widgets/icecreamcard.dart';
import 'package:app/views/IcecreamDetailView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IcecreamView extends StatelessWidget {
  IcecreamView({super.key});
  Future<List<Icecream>?> loadIceCreams() async {
    final rawIcecreams = await rootBundle.loadString("assets/icecream.json");
    await Future.delayed(const Duration(seconds: 1)); // Simulate delay
    final icecreams = icecreamDataFromJson(rawIcecreams);
    return icecreams.icecreams;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text("Icecreams",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
        Text("Find the Best Scoops Around You",
            style: Theme.of(context).textTheme.bodyLarge!),
        SizedBox(
          height: 30,
        ),
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              FutureBuilder(
                future: loadIceCreams(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final icecreams = snapshot.data;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              final icecream = icecreams[index];

                              return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                IcecreamDetailView(
                                                  icecream: icecream,
                                                )));
                                  },
                                  child: IcecreamCard(icecream: icecream));
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: icecreams!.length,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  }
                },
              )
            ]))
      ]),
    );
  }
}
