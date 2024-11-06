import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Color(0xFFCCFF00),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Cari',
            border: InputBorder.none,
            suffixIcon: Icon(Icons.search, color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.sort, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFilterOption('Hari'),
                _buildFilterOption('Minggu'),
                _buildFilterOption('Bulan'),
                _buildFilterOption('Tahun'),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildTransactionItem(
                      '30 Sep 2024', 'Rp450.000', 'Rp550.000', 'Rp150.000', [
                    _buildExpenseDetail(
                        'Makanan', 'Membeli susu dancow', 'Rp10.000'),
                    _buildExpenseDetail(
                        'Parkir', 'Parkir alfamart', 'Rp50.000'),
                  ]),
                  _buildTransactionItem(
                      '29 Sep 2024', 'Rp90.000', 'Rp60.000', 'Rp30.000', [
                    _buildExpenseDetail(
                        'Freelance', 'Freelance PT cihonje', 'Rp90.000'),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.grey),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            IconButton(
              icon: Icon(Icons.history, color: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context, '/history');
              },
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xFFB2E600),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, '/add');
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.category, color: Colors.grey),
              onPressed: () {
                Navigator.pushNamed(context, '/statistik');
              },
            ),
            IconButton(
              icon: Icon(Icons.settings, color: Colors.grey),
              onPressed: () {
                Navigator.pushNamed(context, '/setting');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterOption(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14,
        fontFamily: "Poppins_Regular",
      ),
    );
  }

  Widget _buildTransactionItem(String date, String income, String expense,
      String balance, List<Widget> expenseDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(date, style: TextStyle(fontSize: 24, fontFamily: "Poppins_Bold")),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Pemasukan: $income',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Poppins_Regular",
                    color: Color(0xFFB2E600))),
            Text('Pengeluaran: $expense',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Poppins_Regular",
                    color: Color(0xFFE60000))),
          ],
        ),
        Text('Saldo: $balance',
            style: TextStyle(
                fontSize: 14,
                fontFamily: "Poppins_Regular",
                color: Colors.black)),
        ...expenseDetails,
        Divider(),
      ],
    );
  }

  Widget _buildExpenseDetail(
      String category, String description, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(category,
                style: TextStyle(fontSize: 14, fontFamily: "Poppins_Medium")),
            Text(description,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Poppins_Regular",
                    color: Colors.grey)),
          ],
        ),
        Text(amount, style: TextStyle(color: Colors.red)),
      ],
    );
  }
}
