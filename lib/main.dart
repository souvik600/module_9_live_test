/// module 9 live test Souvik Das

import 'package:flutter/material.dart';

void main() => runApp(SizeButtonsApp());

class SizeButtonsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SizeButtonsScreen(),
    );
  }
}

class SizeButtonsScreen extends StatefulWidget {
  @override
  _SizeButtonsScreenState createState() => _SizeButtonsScreenState();
}

class _SizeButtonsScreenState extends State<SizeButtonsScreen> {
  String selectedSize = '';

  void _showSnackbar(String size) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected Size: $size'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget _buildSizeButton(String size) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedSize = size;
        });
        _showSnackbar(size);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          size == selectedSize ? Colors.orangeAccent : Colors.black12,
        ),
      ),
      child: Text(size),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Size Selector')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildSizeButton('S'),
                _buildSizeButton('M'),
                _buildSizeButton('L'),
                _buildSizeButton('XL'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(width: 22,),
                _buildSizeButton('XXL'),
                const SizedBox(width: 20,),
                _buildSizeButton('XXXL'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
