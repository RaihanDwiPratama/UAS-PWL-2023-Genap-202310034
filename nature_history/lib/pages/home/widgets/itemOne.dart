// FIX
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:nature_history/pages/home/styles.dart';
import 'package:nature_history/pages/home/widgets/flower.dart';
import '../../detail/detailBungaPage.dart';

class ItemOne extends StatefulWidget {
  @override
  _ItemOneState createState() => _ItemOneState();
}

class _ItemOneState extends State<ItemOne> {
  List<Flower> flowerList = [];

  @override
  void initState() {
    super.initState();
    fetchFlowerList();
  }

  Future<void> fetchFlowerList() async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/api/flowers'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        flowerList = data.map((item) {
          return Flower(
            imagePath: item['imagePath'],
            title: item['title'],
            description: item['description'],
          );
        }).toList();
      });
    } else {
      throw Exception('Failed to fetch flower list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 80),
        Text("Decorative Flowers", style: Styles.textTitleItem),
        Container(
          width: 1100,
          height: 230,
          margin: EdgeInsets.only(top: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: flowerList.length,
            itemBuilder: (context, index) {
              Flower flower = flowerList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailBungaPage(
                              flower: flower,
                            ) // Navigasi ke halaman detail bunga dengan objek Flower
                        ),
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      width: 140,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: Styles.containerImage,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          flower.imagePath,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 125,
                      left: 20,
                      child: Container(
                        width: 140,
                        height: 90,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: Styles.containerModalDescription,
                        child: Column(
                          children: [
                            Text(flower.title, style: Styles.textTitle),
                            SizedBox(height: 5),
                            Text(flower.description,
                                style: Styles.textSubtitle),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}