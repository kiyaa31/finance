import 'package:flutter/material.dart';
import '../widgets/atm_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Fungsi format angka dengan titik ribuan
  String formatNumber(int number) {
    return number.toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]}.");
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    // Dummy data
    final int totalSaldo = 3200000;
    final int totalPengeluaran = 250000;
    final int totalPemasukan = 3200000;

    final double pengeluaranPercent = (totalPengeluaran / totalSaldo).clamp(0.0, 1.0);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Welcome, Tazkia 👋",
          style: TextStyle(
            color: color.primary,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // Saldo Saat Ini (biru–cream)
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF3AB5FF), Color(0xFFEFE3D6)], // biru cerah ke cream
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Saldo Saat Ini",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Rp ${formatNumber(totalSaldo)}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // ATM Cards
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  SizedBox(width: 12),
                  ATMCard(
                    cardNumber: "**** **** 1234 5678",
                    name: "Tazkia",
                    startColor: Color(0xFF3AB5FF),
                    endColor: Color(0xFF6EC1FF),
                  ),
                  SizedBox(width: 16),
                  ATMCard(
                    cardNumber: "**** **** 9876 5432",
                    name: "Tazkia",
                    startColor: Color(0xFF89C9FF),
                    endColor: Color(0xFFA3D9FF),
                  ),
                  SizedBox(width: 16),
                  ATMCard(
                    cardNumber: "**** **** 1111 2222",
                    name: "Tazkia",
                    startColor: Color(0xFF1E88E5),
                    endColor: Color(0xFF64B5F6),
                  ),
                  SizedBox(width: 12),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Grid Menu
            const Text("Menu",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.9,
              children: [
                menuItem(Icons.send, "Transfer", Colors.blueAccent, Colors.blue.shade100),
                menuItem(Icons.history, "Riwayat", Colors.lightBlue, Colors.blue.shade100),
                menuItem(Icons.savings, "Tabungan", Colors.blue.shade700, Colors.blue.shade100),
                menuItem(Icons.qr_code, "QR Pay", Colors.teal.shade700, Colors.teal.shade100),
                menuItem(Icons.credit_card, "Kartu", Colors.cyan.shade700, Colors.cyan.shade100),
                menuItem(Icons.settings, "Pengaturan", Colors.indigo.shade700, Colors.indigo.shade100),
                menuItem(Icons.phone_android, "Top Up", Colors.purple, Colors.purple.shade100),
                menuItem(Icons.shopping_cart, "Belanja", Colors.orange, Colors.orange.shade100),
                menuItem(Icons.more_horiz, "Lainnya", Colors.grey.shade700, Colors.grey.shade200),
              ],
            ),

            const SizedBox(height: 24),

            // Total Pemasukan & Pengeluaran
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF00C853), Color(0xFFB9F6CA)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text("Pemasukan",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        Text("+ Rp ${formatNumber(totalPemasukan)}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFD50000), Color(0xFFFF8A80)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text("Pengeluaran",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        Text("- Rp ${formatNumber(totalPengeluaran)}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Progress bar pengeluaran
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Pengeluaran vs Saldo",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Stack(
                  children: [
                    Container(
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    Container(
                      height: 12,
                      width: MediaQuery.of(context).size.width * pengeluaranPercent,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),

            const Text("Riwayat Transaksi",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),

            transaksiItem("Beli Pulsa", -25000, Colors.red, Icons.phone_android, "12 Nov 2025, 09:00"),
            transaksiItem("Gaji", 3200000, Colors.green, Icons.attach_money, "11 Nov 2025, 08:00"),
            transaksiItem("Belanja", -150000, Colors.orange, Icons.shopping_cart, "10 Nov 2025, 14:30"),
            transaksiItem("Top Up E-Wallet", -75000, Colors.purple, Icons.account_balance_wallet, "09 Nov 2025, 10:15"),
          ],
        ),
      ),
    );
  }

  Widget menuItem(IconData icon, String title, Color iconColor, Color bgColor) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [bgColor, bgColor.withOpacity(0.7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: iconColor),
            const SizedBox(height: 6),
            Text(title, style: const TextStyle(color: Colors.black87, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget transaksiItem(String title, int amount, Color color, IconData icon, String date) {
    String formattedAmount = (amount >= 0 ? "+ Rp " : "- Rp ") + formatNumber(amount.abs());

    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
      builder: (context, double value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, (1 - value) * 20),
            child: child,
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color),
          ),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text(date, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          trailing: Text(
            formattedAmount,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
