import 'package:app/icecream/icecream.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class IcecreamCard extends StatelessWidget {
  const IcecreamCard({
    super.key,
    required this.icecream,
  });

  final Icecream icecream;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.blue.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(fit: StackFit.expand, children: [
          CachedNetworkImage(
            imageUrl: icecream.image!,
            fit: BoxFit.cover,
            color: const Color.fromARGB(255, 255, 221, 68).withOpacity(0.4),
            colorBlendMode: BlendMode.color,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white, //for price of icecream
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      icecream.flavor,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      "Rs. ${icecream.price.toString()}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}
