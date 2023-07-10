import 'package:flutter/material.dart';

import '../models/trainer.dart';



class TrainerListScreen extends StatelessWidget {
  final List<Trainer> trainers = [
    Trainer(
      name: "John Doe",
      description: "Certified personal trainer with 10+ years of experience.",
      price: 10000,
      // imagePath: "assets/images/john_doe.jpg",
    ),
    Trainer(
      name: "Jane Smith",
      description:
          "Specialized in strength training and weightlifting techniques.",
      // imagePath: "assets/images/jane_smith.jpg",
      price: 20000,
    ),
    Trainer(
      name: "John Doe",
      description: "Certified personal trainer with 10+ years of experience.",
      price: 10000,
      // imagePath: "assets/images/john_doe.jpg",
    ),
    Trainer(
      name: "Jane Smith",
      description:
          "Specialized in strength training and weightlifting techniques.",
      // imagePath: "assets/images/jane_smith.jpg",
      price: 20000,
    ),
    Trainer(
      name: "John Doe",
      description: "Certified personal trainer with 10+ years of experience.",
      price: 10000,
      // imagePath: "assets/images/john_doe.jpg",
    ),
    Trainer(
      name: "Jane Smith",
      description:
          "Specialized in strength training and weightlifting techniques.",
      // imagePath: "assets/images/jane_smith.jpg",
      price: 20000,
    ),
    Trainer(
      name: "John Doe",
      description: "Certified personal trainer with 10+ years of experience.",
      price: 10000,
      // imagePath: "assets/images/john_doe.jpg",
    ),
    Trainer(
      name: "Jane Smith",
      description:
          "Specialized in strength training and weightlifting techniques.",
      // imagePath: "assets/images/jane_smith.jpg",
      price: 20000,
    ),
    Trainer(
      name: "John Doe",
      description: "Certified personal trainer with 10+ years of experience.",
      price: 10000,
      // imagePath: "assets/images/john_doe.jpg",
    ),
    Trainer(
      name: "Jane Smith",
      description:
          "Specialized in strength training and weightlifting techniques.",
      // imagePath: "assets/images/jane_smith.jpg",
      price: 20000,
    ),
    Trainer(
      name: "John Doe",
      description: "Certified personal trainer with 10+ years of experience.",
      price: 10000,
      // imagePath: "assets/images/john_doe.jpg",
    ),
    Trainer(
      name: "Jane Smith",
      description:
          "Specialized in strength training and weightlifting techniques.",
      // imagePath: "assets/images/jane_smith.jpg",
      price: 20000,
    ),
    Trainer(
      name: "John Doe",
      description: "Certified personal trainer with 10+ years of experience.",
      price: 10000,
      // imagePath: "assets/images/john_doe.jpg",
    ),
    Trainer(
      name: "Jane Smith",
      description:
          "Specialized in strength training and weightlifting techniques.",
      // imagePath: "assets/images/jane_smith.jpg",
      price: 20000,
    ),
    Trainer(
      name: "John Doe",
      description: "Certified personal trainer with 10+ years of experience.",
      price: 10000,
      // imagePath: "assets/images/john_doe.jpg",
    ),
    Trainer(
      name: "Jane Smith",
      description:
          "Specialized in strength training and weightlifting techniques.",
      // imagePath: "assets/images/jane_smith.jpg",
      price: 20000,
    ),
    Trainer(
      name: "John Doe",
      description: "Certified personal trainer with 10+ years of experience.",
      price: 10000,
      // imagePath: "assets/images/john_doe.jpg",
    ),
    Trainer(
      name: "Jane Smith",
      description:
          "Specialized in strength training and weightlifting techniques.",
      // imagePath: "assets/images/jane_smith.jpg",
      price: 20000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trainers'),
      ),
      body: ListView.builder(
        itemCount: trainers.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: (trainers[index].imagePath != null)
                  ? CircleAvatar(
                      backgroundImage: AssetImage(trainers[index].imagePath!),
                    )
                  : Icon(Icons.person),
              title: Text(trainers[index].name),
              subtitle: Text(trainers[index].description),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(trainers[index].name),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(trainers[index].description,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(height: 20),
                          Text(
                            "Цена за одно занятие: ${trainers[index].price} руб",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // реализовать отправку в базу данных информацию о выборе тренера
                            Navigator.of(context).pop();
                          },
                          child: Text('Записаться',
                              style: TextStyle(fontSize: 20)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child:
                              Text('Закрыть', style: TextStyle(fontSize: 20)),
                        ),
                      ],
                    );
                  },
                );
              });
        },
      ),
    );
  }
}
