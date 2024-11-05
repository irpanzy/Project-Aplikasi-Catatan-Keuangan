import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], 
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.lime[400],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/ganesha.png'), // Replace with actual profile image path
                          radius: 24,
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Halo! Ganesha Rahman',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.notifications_none, color: Colors.black54),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Saldo anda',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    Text(
                      '150.000 IDR',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // Expense section
              Text(
                'Pengeluaran Terbesar Bulan ini',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Column(
                children: [
                  _buildExpenseItem('Fashion', 'Sepatu ardiles', 'Rp100,000.00'),
                  _buildExpenseItem('Sedekah', 'Traktir teman', 'Rp50,000.00'),
                  _buildExpenseItem('Rumah', 'Lampu Bohlam', 'Rp50,000.00'),
                ],
              ),
              SizedBox(height: 24),

              // Monthly recap section with pie chart
              Text(
                'Recap bulan ini',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIncomeExpenseBox(
                      Icons.arrow_upward, 'Pemasukan', '2.000 IDR', Colors.green),
                  _buildIncomeExpenseBox(Icons.arrow_downward, 'Pengeluaran',
                      '10.000 IDR', Colors.red),
                ],
              ),
              SizedBox(height: 16),
              _buildPieChart(),
            ],
          ),
        ),
      ),
      
      // Bottom Navigation Bar
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
              offset: Offset(0, -2), // Posisi shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.history, color: Colors.grey),
              onPressed: () {},
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green[500],
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: () {},
              ),
            ),
            IconButton(
              icon: Icon(Icons.category, color: Colors.grey),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings, color: Colors.grey),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build expense item
  Widget _buildExpenseItem(String category, String description, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(category,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Text(description,
                  style: TextStyle(fontSize: 12, color: Colors.grey[700])),
            ],
          ),
          Text(amount, style: TextStyle(fontSize: 14, color: Colors.red)),
        ],
      ),
    );
  }

  // Helper widget for income and expense box
  Widget _buildIncomeExpenseBox(
      IconData icon, String title, String amount, Color color) {
    return Container(
      width: 120,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color),
          SizedBox(height: 8),
          Text(title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          Text(amount, style: TextStyle(fontSize: 14, color: Colors.black)),
        ],
      ),
    );
  }

  // Method to build the pie chart
  Widget _buildPieChart() {
    return AspectRatio(
      aspectRatio: 1.3,
      child: PieChart(
        PieChartData(
          sections: _getSections(),
          centerSpaceRadius: 100,
          sectionsSpace: 4,
        ),
      ),
    );
  }

  // Method to define each section of the pie chart
  List<PieChartSectionData> _getSections() {
    return [
      PieChartSectionData(
        color: Colors.green,
        value: 20,
        title: '20%',
        radius: 50,
        titleStyle: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.red,
        value: 80,
        title: '80%',
        radius: 50,
        titleStyle: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ];
  }
}
