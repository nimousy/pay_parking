import 'package:flutter/material.dart';
import 'payment.dart';

class EWalletPage extends StatefulWidget {
  @override
  _EWalletPageState createState() => _EWalletPageState();
}

class _EWalletPageState extends State<EWalletPage> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('E-Wallet'),
        backgroundColor: Colors.green,
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildEWalletOption(context, 'Touch n Go', screenWidth),
            _buildEWalletOption(context, 'Boost', screenWidth),
            _buildEWalletOption(context, 'ShopeePay', screenWidth),
            _buildEWalletOption(context, 'GrabPay', screenWidth),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (selectedOption != null) {
                  print('Bank: $selectedOption');

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(),
                    ),
                  );
                } else {
                  print('Please select an e-wallet for payment');
                }
              },
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEWalletOption(BuildContext context, String option, double screenWidth) {
    bool isSelected = selectedOption == option;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = isSelected ? null : option;
        });
      },
      child: Container(
        width: screenWidth,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: isSelected ? Border.all(color: Colors.grey) : null,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              option,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Add any additional content for each eWallet option here
          ],
        ),
      ),
    );
  }
}



