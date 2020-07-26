import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../charts/chart_widgets/transaction_details_pie_chart.dart';
import '../providers/transactions.dart';
import '../utils/custom_colors.dart';

class TransactionDetailsChartsView extends StatefulWidget {
  final String transactionId;

  const TransactionDetailsChartsView({
    @required this.transactionId,
  });

  @override
  _TransactionDetailsChartsViewState createState() =>
      _TransactionDetailsChartsViewState();
}

class _TransactionDetailsChartsViewState
    extends State<TransactionDetailsChartsView> {
  @override
  Widget build(BuildContext context) {
    final transactionsData = Provider.of<Transactions>(context);
    final transaction = transactionsData.findById(widget.transactionId);

    return TransactionDetailsPieChart(
      transactionTitle: transaction.title,
      otherTitle: 'Other ' + (transaction.amount < 0 ? 'Expenses' : 'Income'),
      transactionAmount: transaction.amount,
      totalAmount: transaction.amount > 0
          ? transactionsData.incomeTotal
          : transactionsData.expensesTotal,
      mainColor: CustomColors.transactionTypeColor(transaction.amount),
      otherColor:
          CustomColors.secondaryTransactionTypeColor(transaction.amount),
    );
  }
}
