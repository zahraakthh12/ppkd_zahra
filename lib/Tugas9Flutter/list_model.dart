import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:ppkd_zahra/Tugas9Flutter/constants.dart';


// List View List
class ListviewListWidget extends StatefulWidget {
  const ListviewListWidget({super.key});

  @override
  State<ListviewListWidget> createState() =>
      _ListviewListWidgetState();
}

class _ListviewListWidgetState extends State<ListviewListWidget> {
  final List<String> nameSecondHand = ["Kardus Bekas (1kg)", "Botol Plastik 600ml Bekas (1kg)", "Jerigen 5 liter Bekas", "Karung Bekas (1kg)", "Gelas Plastik Bekas (1kg)", "Koran Bekas (1kg)", "Besi Bekas (1kg)", "Kulkas 2 Pintu TOSHIBA Bekas", "Mesin Cuci SANKEN Bekas", "Laptop ASUS X441M Bekas"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: nameSecondHand.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text(nameSecondHand[index]));
      },
    );
  }
}


// List View List Map
class ListviewListMapWidget extends StatefulWidget {
  const ListviewListMapWidget({super.key});

  @override
  State<ListviewListMapWidget> createState() =>
      _ListviewListMapWidgetState();
}

class _ListviewListMapWidgetState
    extends State<ListviewListMapWidget> {
  final List<Map<String, dynamic>> nameSecondHand = [
    {
      "name": "Kardus Bekas (1kg)",
      "price": 10000,
      "icon" : Icons.card_giftcard,
    },
    {
      "name": "Botol Plastik 600ml Bekas (1kg)",
      "price": 12000,
      "icon" : Icons.local_drink,
    },
    {
      "name": "Jerigen 5 liter Bekas",
      "price": 5000,
      "icon" : Icons.local_drink
    },
    {
      "name": "Karung Bekas (1kg)",
      "price": 20000,
      "icon" : Icons.badge,
    },
    {
      "name": "Gelas Plastik Bekas (1kg)",
      "price": 14000,
      "icon" : Icons.local_drink
    },
    {
      "name": "Koran Bekas (1kg)",
      "price": 20000,
      "icon": Icons.book
    },
    {
      "name": "Besi Bekas (1kg)",
      "price": 25000,
      "icon" : Icons.iron
    },
    {
      "name": "Kulkas 2 Pintu TOSHIBA Bekas",
      "price": 1350000,
      "icon" : Icons.icecream_rounded
    },
    {
      "name": "Mesin Cuci SANKEN Bekas",
      "price": 600000,
      "icon" : Icons.cleaning_services
    },
    {
      "name": "Laptop ASUS X441M Bekas",
      "price": 1650000,
      "icon" : Icons.laptop
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: nameSecondHand.length,
      itemBuilder: (BuildContext context, int index) {
        final item = nameSecondHand[index];
        return ListTile(
          onTap: () {
            //Versi 3
            DelightToastBar(
              autoDismiss: true,
              snackbarDuration: Duration(milliseconds: 2000),
              builder: (context) => ToastCard(
                leading: Icon(Icons.flutter_dash, size: 28),
                title: Text(
                  "${item["name"]} ${item["price"].toString().toRPCurrency()} aja",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
              ),
            ).show(context);
          },
          leading: Icon(item["icon"]),
          title: Text(item["name"]),
          subtitle: Text(item["price"].toString().toRPCurrency()),
        );
      },
    );
  }
}


// List View Model
class ListviewListModelWidget extends StatefulWidget {
  const ListviewListModelWidget({super.key});

  @override
  State<ListviewListModelWidget> createState() =>
      _ListviewListModelWidgetState();
}

class _ListviewListModelWidgetState
    extends State<ListviewListModelWidget> {
  final List<SecondHandModel> nameSecondHand = [
    SecondHandModel(
      name: "Kardus Bekas (1kg)",
      price: 10000,
      condition: "Bekas",
      backgroundColor: const Color.fromARGB(255, 233, 212, 218),
      image: AppImages.kardus,
    ),
    SecondHandModel(
      name: "Botol Plastik 600ml Bekas (1kg)",
      price: 12000,
      condition: "Bekas",
      backgroundColor: Colors.white,
      image: AppImages.botol,
    ),
    SecondHandModel(
      name: "Jerigen 5 liter Bekas",
      price: 5000,
      condition: "Bekas",
      backgroundColor: const Color.fromARGB(255, 233, 212, 218),
      image: AppImages.jerigen,
    ),
    SecondHandModel(
      name: "Karung Bekas (1kg)",
      price: 20000,
      condition: "Bekas",
      backgroundColor: Colors.white,
      image: AppImages.karung,
    ),
    SecondHandModel(
      name: "Gelas Plastik Bekas (1kg)",
      price: 14000,
      condition: "Bekas",
      backgroundColor: const Color.fromARGB(255, 233, 212, 218),
      image: AppImages.gelas,
    ),
    SecondHandModel(
      name: "Koran Bekas (1kg)",
      price: 20000,
      condition: "Bekas",
      backgroundColor: Colors.white,
      image: AppImages.koran,
    ),
    SecondHandModel(
      name: "Besi Bekas (1kg)",
      price: 25000,
      condition: "Bekas",
      backgroundColor: const Color.fromARGB(255, 233, 212, 218),
      image: AppImages.besi,
    ),
    SecondHandModel(
      name: "Kulkas 2 Pintu TOSHIBA Bekas",
      price: 1350000,
      condition: "Bekas",
      backgroundColor: Colors.white,
      image: AppImages.kulkas,
    ),
    SecondHandModel(
      name: "Mesin Cuci SANKEN Bekas",
      price: 600000,
      condition: "Bekas",
      backgroundColor: const Color.fromARGB(255, 233, 212, 218),
      image: AppImages.mesincuci,
    ),
    SecondHandModel(
      name: "Laptop ASUS X441M Bekas",
      price: 1650000,
      condition: "Bekas",
      backgroundColor: Colors.white,
      image: AppImages.laptop,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: nameSecondHand.length,
      itemBuilder: (BuildContext context, int index) {
        final item = nameSecondHand[index];
        return ListTile(
          onTap: () {
            DelightToastBar(
              autoDismiss: true,
              snackbarDuration: Duration(milliseconds: 2000),
              builder: (context) => ToastCard(
                leading: Icon(Icons.flutter_dash, size: 28),
                title: Text(
                  "${item.name} ${item.price.toString().toRPCurrency()} aja",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
              ),
            ).show(context);
          },
          tileColor: item.backgroundColor,
          leading: Image.asset(item.image, width: 60),
          title: Text(item.name),
          subtitle: Text(item.price.toString().toRPCurrency()),
        );
      },
    );
  }
}