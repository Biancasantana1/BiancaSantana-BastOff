import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;

  CustomErrorWidget({required this.errorMessage, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 50.0,
          ),
          SizedBox(height: 10.0),
          Text(
            'Error Ocorrido!',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: onRetry,
            child: Text('Recarregar'),
          ),
        ],
      ),
    );
  }
}
