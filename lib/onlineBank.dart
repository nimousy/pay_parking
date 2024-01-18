import 'package:flutter/material.dart';
import 'payment.dart';

class OnlineBankPage extends StatefulWidget {
  const OnlineBankPage({Key? key}) : super(key: key);

  @override
  _OnlineBankPageState createState() => _OnlineBankPageState();
}

class _OnlineBankPageState extends State<OnlineBankPage> {
  String? selectedBank;
  bool agreedToTerms = false;
  List<String> predefinedBanks = ['Maybank2U', 'CIMB Clicks', 'Public Bank', 'RHB Bank'];
  List<String> otherBanks = ['--Select Bank--', 'Bank A', 'Bank B', 'Bank C'];
  String? tappedBank;

  @override
  void initState() {
    super.initState();
    // Initialize selectedBank with the default value
    selectedBank = otherBanks.first;
    tappedBank = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Banking'),
        backgroundColor: Colors.green, // Set the initial color
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF00ffd0), Color(0xFF0093b4)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.4, 1.0],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose your online bank:',
              style: TextStyle(fontSize: 18),
            ),
            // Display predefined banks in a Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Predefined Banks:'),
                ...predefinedBanks.map((String bank) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedBank = tappedBank == bank ? null : bank;
                        tappedBank = bank;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      decoration: BoxDecoration(
                        color: tappedBank == bank ? Colors.grey.withOpacity(0.5) : null,
                        border: Border.all(
                          color: tappedBank == bank ? Colors.grey : Colors.transparent,
                        ),
                      ),
                      child: Text(bank),
                    ),
                  );
                }),
              ],
            ),
            const SizedBox(height: 16),
            // Dropdown for other banks
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Other Banks:'),
                DropdownButton<String>(
                  value: tappedBank == null ? selectedBank : null,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedBank = newValue;
                    });
                  },
                  items: otherBanks.map((String bank) {
                    return DropdownMenuItem<String>(
                      value: bank,
                      child: Text(bank),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: agreedToTerms,
                  onChanged: (bool? value) {
                    setState(() {
                      agreedToTerms = value!;
                    });
                  },
                ),
                const Text('I agree to the terms and conditions'),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                if (selectedBank != null && agreedToTerms) {
                  print('Bank: $selectedBank');
                  print('Terms Agreed: $agreedToTerms');

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(),
                    ),
                  );
                } else {
                  print('Please select a bank and agree to terms.');
                }
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
