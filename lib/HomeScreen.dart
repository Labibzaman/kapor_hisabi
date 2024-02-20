import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController priceTeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              'কাপড় হিসাবি',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 28,
                  color: Colors.white),
            ),
            Text(
              'সঠিক ম্যাপ',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
            ),
          ],
        ),
        backgroundColor: Colors.greenAccent.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextFormField(
              controller: priceTeController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter দাম';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  label: Text('দাম'),
                  prefixIcon: Icon(Icons.price_change_outlined)),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: priceTeController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter গজ';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  label: Text('গজ'),
                  prefixIcon: Icon(Icons.price_change_outlined)),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: priceTeController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter গিরা';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  label: Text('গিরা'),
                  prefixIcon: Icon(Icons.price_change_outlined)),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    SizedBox(width: 100),
                    Icon(Icons.calculate),
                    Text('মাপুন')
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
