import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController priceTeController = TextEditingController();
  final TextEditingController gojTeController = TextEditingController();
  final TextEditingController giraTeController = TextEditingController();
  String selectedGiraValue = '0';

  double result = 0;

  @override
  void initState() {
    super.initState();
    gojTeController.text = '0';
    selectedGiraValue = '0';
  }

  Map<String, double> giraToNumber = {
    'Select Gira': 0,
    '1': 0.0625,
    '2': 0.125,
    '3': 0.1865,
    '4': 0.25,
    '5': 0.3125,
    '6': 0.375,
    '7': 0.4375,
    '8-Half Goj': 0.5,
    '9': 0.5625,
    '10': 0.625,
    '11': 0.6875,
    '12': 0.75,
    '13': 0.8125,
    '14': 0.875,
    '15': 0.9375,
    '16': 1,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/logo1.png',
          height: 38,
          width: 95,
          fit: BoxFit.cover,
        ),
        elevation: 4,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              'Kapor Hisabi',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 27,
                  color: Colors.black54),
            ),
            Text(
              'সঠিক ম্যাপ',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SafeArea(
          child: SingleChildScrollView(
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
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      label: Text('দাম'),
                      prefixIcon: Icon(Icons.price_change_outlined)),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: gojTeController,
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
                      prefixIcon: Icon(Icons.scanner_rounded)),
                ),
                const SizedBox(height: 15),
                DropdownButtonFormField(
                  value: giraToNumber.values.first,
                  items: giraToNumber.entries
                      .map((e) => DropdownMenuItem(
                            value: e.value,
                            child: Text(e.key),
                          ))
                      .toList(),
                  onChanged: (value) {
                    selectedGiraValue = value.toString();
                  },
                  elevation: 4,
                  decoration: const InputDecoration(
                    counterStyle: TextStyle(fontSize: 18),
                    contentPadding: EdgeInsets.all(16),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  dropdownColor: Colors.lightBlue[50],
                  // Adjust dropdown background color
                  itemHeight: 50,
                  // Adjust item height
                  // Adjust elevation for depth effect (optional)
                  iconSize: 24,
                  // Adjust icon size (optional)
                  iconEnabledColor:
                      Colors.grey.shade500, // Adjust icon color (optional)
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    double price = double.parse(priceTeController.text);
                    double goj = double.parse(gojTeController.text);
                    double gira = double.parse(selectedGiraValue);

                    result = price * (goj + gira);

                    setState(() {});
                  },
                  child: const Row(
                    children: [
                      SizedBox(width: 95),
                      Icon(Icons.calculate),
                      Text(' Calculate')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Total Price: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        '$result',
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
