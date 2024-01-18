import 'package:flutter/material.dart';
import 'payment.dart';

class CreditDebitPage extends StatefulWidget {
  @override
  _CreditDebitPageState createState() => _CreditDebitPageState();
}

class _CreditDebitPageState extends State<CreditDebitPage> {
  List<String> cardDetails = [];
  bool setAsDefault = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credit/Debit Card'),
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Add card image section
            GestureDetector(
              onTap: () {
                _showAddCardDialog(context);
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Display entered card details
            if (cardDetails.isNotEmpty)
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card Number: ${cardDetails[0]}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Exp. Date: ${cardDetails[1]}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'CVV: ${cardDetails[2]}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 16),
            // Add Set as default card section
            Row(
              children: [
                Checkbox(
                  value: setAsDefault,
                  onChanged: (bool? value) {
                    setState(() {
                      setAsDefault = value ?? false;
                    });
                  },
                ),
                Text('Set as default card'),
              ],
            ),
            SizedBox(height: 16),
            
            ElevatedButton(
              onPressed: () {
                if (cardDetails != null) {
                  print('Bank: $cardDetails');

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(),
                    ),
                  );
                } else {
                  print('Please add a card to proceed with payment');
                }
              },
              child: Text('Confirm'),
            ),

          ],
        ),
      ),
    );
  }

  void _showAddCardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Card'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Card Number'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  cardDetails.add(value);
                },
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(labelText: 'Exp. Date'),
                keyboardType: TextInputType.datetime,
                onChanged: (value) {
                  cardDetails.add(value);
                },
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(labelText: 'CVV'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  cardDetails.add(value);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add functionality for handling the entered card details
                // For example, you can store the details or perform validation
                setState(() {});
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  
}
