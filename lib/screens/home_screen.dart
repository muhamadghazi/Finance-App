import 'package:flutter/material.dart';
import '../widgets/atm_card.dart';
import '../widgets/grid_menu_item.dart';
import '../widgets/transaction_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showAllBanks = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],

      // 🔹 AppBar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.blue.withOpacity(0.1),
        title: Row(
          children: [
            const Icon(
              Icons.account_balance_wallet_outlined,
              color: Colors.blue,
            ),
            const SizedBox(width: 8),
            const Text(
              'CuanGhi',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Colors.blue,
            ),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            _showAllBanks ? _buildAllBanks() : _buildSingleBankAndButton(),

            _buildSectionTitle('Menu'),
            _buildGridMenu([
              GridMenuItem(icon: Icons.send, title: 'Transfer', onTap: () {}),
              GridMenuItem(
                icon: Icons.qr_code_scanner,
                title: 'QRIS',
                onTap: () {},
              ),
              GridMenuItem(
                icon: Icons.account_balance_wallet,
                title: 'Top Up',
                onTap: () {},
              ),
              GridMenuItem(
                icon: Icons.payment,
                title: 'Bayar Tagihan',
                onTap: () {},
              ),
              GridMenuItem(
                icon: Icons.monetization_on,
                title: 'Investasi',
                onTap: () {},
              ),
              GridMenuItem(
                icon: Icons.menu_book,
                title: 'Catatan',
                onTap: () {},
              ),
              GridMenuItem(icon: Icons.history, title: 'History', onTap: () {}),
              GridMenuItem(
                icon: Icons.more_horiz,
                title: 'Menu Lain',
                onTap: () {},
              ),
            ]),

            _buildSectionTitle('Recent Transactions'),
            const TransactionItem(
              title: 'Pulsa Telkomsel',
              date: '5 Nov 2025',
              amount: 25000,
            ),
            const TransactionItem(
              title: 'Gaji Bulanan',
              date: '1 Nov 2025',
              amount: 5000000,
              isExpense: false,
            ),
            const TransactionItem(
              title: 'Grab Ride',
              date: '4 Nov 2025',
              amount: 23000,
            ),
            const TransactionItem(
              title: 'Listrik PLN',
              date: '3 Nov 2025',
              amount: 185000,
            ),
            const TransactionItem(
              title: 'ShopeePay Top Up',
              date: '2 Nov 2025',
              amount: 150000,
              isExpense: true,
            ),
            const TransactionItem(
              title: 'Bunga Tabungan',
              date: '31 Okt 2025',
              amount: 85000,
              isExpense: false,
            ),
            const TransactionItem(
              title: 'Makan Siang Warteg',
              date: '6 Nov 2025',
              amount: 18000,
            ),
            const TransactionItem(
              title: 'Transfer ke Andi',
              date: '6 Nov 2025',
              amount: 50000,
            ),
            const TransactionItem(
              title: 'GoFood - Kopi Kenangan',
              date: '5 Nov 2025',
              amount: 32000,
            ),
            const TransactionItem(
              title: 'Bonus Project Freelance',
              date: '5 Nov 2025',
              amount: 750000,
              isExpense: false,
            ),
            const TransactionItem(
              title: 'Pembayaran WiFi Indihome',
              date: '4 Nov 2025',
              amount: 280000,
            ),
            const TransactionItem(
              title: 'Belanja Alfamart',
              date: '3 Nov 2025',
              amount: 67000,
            ),
            const TransactionItem(
              title: 'Cashback Promo QRIS',
              date: '2 Nov 2025',
              amount: 10000,
              isExpense: false,
            ),
            const TransactionItem(
              title: 'Netflix Subscription',
              date: '1 Nov 2025',
              amount: 54000,
            ),
            const TransactionItem(
              title: 'Isi Saldo E-Toll',
              date: '31 Okt 2025',
              amount: 100000,
            ),
            const TransactionItem(
              title: 'Transfer dari Orang Tua',
              date: '30 Okt 2025',
              amount: 1000000,
              isExpense: false,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // 🔸 Header
  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hallo',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
              const SizedBox(height: 4),
              const Text(
                'Muhamad Ghazi Al Ghifari',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  // 🔸 Satu bank + tombol lihat semua
  Widget _buildSingleBankAndButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Judul "MyCard"
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'MyCard',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black, // warna hitam
            ),
          ),
        ),
        const SizedBox(height: 8),
        const AtmCard(
          bankName: 'Bank A',
          cardNumber: '**** 9012',
          saldo: 2500000,
          gradientColors: [Color(0xFF0066B2), Color(0xFF0088CC)],
        ),
        _buildActionButton('Lihat semua bank', () {
          setState(() => _showAllBanks = true);
        }),
      ],
    );
  }

  // 🔸 Semua bank + tombol sembunyikan
  Widget _buildAllBanks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Judul "MyCard"
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'MyCard',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black, // warna hitam
            ),
          ),
        ),
        const SizedBox(height: 8),
        const AtmCard(
          bankName: 'Bank A',
          cardNumber: '**** 9012',
          saldo: 2500000,
          gradientColors: [Color(0xFF0066B2), Color(0xFF0088CC)],
        ),
        const AtmCard(
          bankName: 'Bank B',
          cardNumber: '**** 5678',
          saldo: 4750000,
          gradientColors: [Color(0xFF0055A4), Color(0xFF0077BB)],
        ),
        const AtmCard(
          bankName: 'Bank C',
          cardNumber: '**** 2211',
          saldo: 3100000,
          gradientColors: [Color(0xFF004A87), Color(0xFF0066AA)],
        ),
        const AtmCard(
          bankName: 'Bank D',
          cardNumber: '**** 3344',
          saldo: 2900000,
          gradientColors: [Color(0xFF003366), Color(0xFF005599)],
        ),
        _buildActionButton('Sembunyikan', () {
          setState(() => _showAllBanks = false);
        }),
      ],
    );
  }

  // 🔸 Tombol aksi
  Widget _buildActionButton(String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFF1E90FF),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // 🔸 Section title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // 🔸 Grid menu
  Widget _buildGridMenu(List<GridMenuItem> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: items,
      ),
    );
  }

  // 🔸 Bottom Navigation Bar
  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', true),
              _buildNavItem(Icons.credit_card, 'Cards', false),
              _buildNavItem(Icons.person_outline, 'Profile', false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isActive ? Colors.blue : Colors.grey, size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.blue : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
