import 'package:expensetracker/Local DataBase/CRUDfile.dart';
import 'package:flutter/material.dart';

class StorageProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _expenses = [];

  List<Map<String, dynamic>> get expenses => _expenses;

  // =========================
  // CREATE
  // =========================
  Future<void> saveExpense(
    String title,
    String date,
    String? note,
    String category,
    double amount,
  ) async {
    await DBHelperCRUD.insertExpense({
      'title': title,
      'amount': amount,
      'category': category,
      'note': note,
      'date': date,
    });

    await fetchExpenses();
  }

  // =========================
  // READ
  // =========================
  Future<void> fetchExpenses() async {
    _expenses = await DBHelperCRUD.getAllExpenses();
    notifyListeners();
  }

  // =========================
  // UPDATE
  // =========================
  Future<void> updateExpense(
    int id,
    String title,
    String date,
    String? note,
    String category,
    double amount,
  ) async {
    await DBHelperCRUD.updateExpense(
      id,
      {
        'title': title,
        'amount': amount,
        'category': category,
        'note': note,
        'date': date,
      },
    );

    await fetchExpenses();
  }

  // =========================
  // DELETE
  // =========================
  Future<void> deleteExpense(int id) async {
    await DBHelperCRUD.deleteExpense(id);
    await fetchExpenses();
  }

  // =========================
  // CLEAR ALL
  // =========================
  Future<void> clearAll() async {
    await DBHelperCRUD.deleteAllExpenses();
    _expenses = [];
    notifyListeners();
  }
}
