// ignore_for_file: sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  final Function deleteTx;

  const TransactionList(
    this.transaction,
    this.deleteTx,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transaction.isEmpty
          ? Column(
              children: [
                const Text(
                  'No Transaction Yet!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/payment.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 8,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('₹' '${transaction[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transaction[index].date),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                      ),
                      color: Colors.red,
                      onPressed: () => deleteTx(transaction[index].id),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
