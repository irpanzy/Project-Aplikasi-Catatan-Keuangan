import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatistikScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text('Statistik', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Statistik', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('May 2024', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text("Pemasukan", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Pengeluaran", style: TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
              AspectRatio(
                aspectRatio: 1.3,
                child: PieChart(
                  PieChartData(
                    sections: _getSections(),
                    centerSpaceRadius: 100,
                    sectionsSpace: 4,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Kategori', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              _buildCategoryItem('Gajihan', '52%', '200.000 IDR'),
              _buildCategoryItem('Bonus THR', '25%', '120.000 IDR'),
              _buildCategoryItem('Freelance', '12%', '120.000 IDR'),
              _buildCategoryItem('Olshop', '5%', '120.000 IDR'),
            ],
          ),
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
              icon: Icon(Icons.home, color: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            IconButton(
              icon: Icon(Icons.history, color: Colors.grey),
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

  List<PieChartSectionData> _getSections() {
    return [
      PieChartSectionData(
        color: Color(0xFF455C0B),
        value: 52,
        title: '52%',
        radius: 50,
      ),
      PieChartSectionData(
        color: Color(0xFFB2E600),
        value: 25,
        title: '25%',
        radius: 50,
      ),
      PieChartSectionData(
        color: Colors.teal,
        value: 12,
        title: '12%',
        radius: 50,
      ),
      PieChartSectionData(
        color: Colors.yellow,
        value: 5,
        title: '5%',
        radius: 50,
      ),
    ];
  }

  Widget _buildCategoryItem(String title, String percentage, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color(0xFFB2E600),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(percentage, style: TextStyle(color: Colors.white)),
                ),
                SizedBox(width: 8),
                Text(title, style: TextStyle(fontSize: 16)),
              ],
            ),
            Text(amount, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}