// FIX
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:nature_history/pages/detail/styles.dart';
import 'package:nature_history/pages/detail/widgets/flowerDetail.dart';
import 'package:nature_history/pages/home/widgets/flower.dart';

class Description extends StatefulWidget {
  final Flower flower;

  const Description({required this.flower});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  FlowerDetail? flowerDetail;

  @override
  void initState() {
    super.initState();
    fetchFlowerDetail();
  }

  Future<void> fetchFlowerDetail() async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/api/details'));
    print(response.body);
    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      if (data != null) {
        setState(() {
          flowerDetail = FlowerDetail(
            name: data[0]['name'],
            description: data[0]['description'],
            scientific: data[0]['scientific'],
            genus: data[0]['genus'],
            family: data[0]['family'],
            kingdom: data[0]['kingdom'],
            order: data[0]['order'],
            tribe: data[0]['tribe'],
            image: data[0]['image'],
          );
        });
      } else {
        setState(() {
          flowerDetail = null;
        });
      }
    } else {
      throw Exception('Failed to fetch flower detail');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60),
      padding: EdgeInsets.all(50.0),
      decoration: Styles.containerText,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (flowerDetail != null)
            RichText(
              text: TextSpan(
                text: flowerDetail!.name,
                style: Styles.textPrimary,
                children: <TextSpan>[
                  TextSpan(
                    text: flowerDetail!.description,
                    style: Styles.textSecondary,
                  ),
                ],
              ),
            ),
          SizedBox(height: 50),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (flowerDetail != null)
                    RichText(
                      text: TextSpan(
                        text: 'Scientific name: ',
                        style: Styles.textPrimary,
                        children: <TextSpan>[
                          TextSpan(
                            text: flowerDetail!.scientific,
                            style: Styles.textSecondary,
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 15),
                  if (flowerDetail != null)
                    RichText(
                      text: TextSpan(
                        text: 'Genus: ',
                        style: Styles.textPrimary,
                        children: <TextSpan>[
                          TextSpan(
                            text: flowerDetail!.genus,
                            style: Styles.textSecondary,
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 15),
                  if (flowerDetail != null)
                    RichText(
                      text: TextSpan(
                        text: 'Family: ',
                        style: Styles.textPrimary,
                        children: <TextSpan>[
                          TextSpan(
                            text: flowerDetail!.family,
                            style: Styles.textSecondary,
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 15),
                  if (flowerDetail != null)
                    RichText(
                      text: TextSpan(
                        text: 'Kingdom: ',
                        style: Styles.textPrimary,
                        children: <TextSpan>[
                          TextSpan(
                            text: flowerDetail!.kingdom,
                            style: Styles.textSecondary,
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 15),
                  if (flowerDetail != null)
                    RichText(
                      text: TextSpan(
                        text: 'Order: ',
                        style: Styles.textPrimary,
                        children: <TextSpan>[
                          TextSpan(
                            text: flowerDetail!.order,
                            style: Styles.textSecondary,
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 15),
                  if (flowerDetail != null)
                    RichText(
                      text: TextSpan(
                        text: 'Tribe: ',
                        style: Styles.textPrimary,
                        children: <TextSpan>[
                          TextSpan(
                            text: flowerDetail!.tribe,
                            style: Styles.textSecondary,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              Spacer(),
              Image.network(
                flowerDetail!.image,
                width: 350,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
