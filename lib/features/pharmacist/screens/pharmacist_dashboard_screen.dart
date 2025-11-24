import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../auth/screens/login_screen.dart';

class PharmacistDashboardScreen extends StatefulWidget {
  const PharmacistDashboardScreen({super.key});

  @override
  State<PharmacistDashboardScreen> createState() =>
      _PharmacistDashboardScreenState();
}

class _PharmacistDashboardScreenState extends State<PharmacistDashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacist Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Navigate to notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _handleLogout(context),
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          InventoryTab(),
          ExpiryAlertsTab(),
          SearchMedicineTab(),
        ],
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton.extended(
              onPressed: () {
                // TODO: Navigate to add batch screen
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Add new medicine batch')),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Batch'),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Inventory',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'Expiry Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }

  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

// Inventory Tab
class InventoryTab extends StatelessWidget {
  const InventoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final batches = _getMockBatches();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppTheme.pharmacistTheme,
                AppTheme.pharmacistTheme.withOpacity(0.8)
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Medicine Inventory',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                '${batches.length} batches in stock',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search medicines...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: batches.length,
            itemBuilder: (context, index) {
              final batch = batches[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.pharmacistTheme.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.medication,
                      color: AppTheme.pharmacistTheme,
                    ),
                  ),
                  title: Text(
                    batch['name'],
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    'Batch: ${batch['batchNumber']} | Stock: ${batch['quantity']}',
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Exp: ${batch['expiry']}',
                        style: TextStyle(
                          fontSize: 12,
                          color: _getExpiryColor(batch['daysToExpiry']),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Rs. ${batch['price']}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // TODO: Show batch details
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Color _getExpiryColor(int days) {
    if (days < 7) return AppTheme.errorColor;
    if (days < 30) return AppTheme.warningColor;
    return AppTheme.successColor;
  }

  List<Map<String, dynamic>> _getMockBatches() {
    return [
      {
        'name': 'Paracetamol 500mg',
        'batchNumber': 'BATCH001',
        'quantity': 500,
        'expiry': 'Dec 2025',
        'daysToExpiry': 365,
        'price': 5.0,
      },
      {
        'name': 'Amoxicillin 250mg',
        'batchNumber': 'BATCH002',
        'quantity': 300,
        'expiry': 'Jan 2025',
        'daysToExpiry': 38,
        'price': 15.0,
      },
      {
        'name': 'Ibuprofen 400mg',
        'batchNumber': 'BATCH003',
        'quantity': 150,
        'expiry': 'Nov 2024',
        'daysToExpiry': 5,
        'price': 8.0,
      },
    ];
  }
}

// Expiry Alerts Tab
class ExpiryAlertsTab extends StatelessWidget {
  const ExpiryAlertsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final expiringBatches = _getExpiringBatches();

    return expiringBatches.isEmpty
        ? _buildEmptyState(context)
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: expiringBatches.length,
            itemBuilder: (context, index) {
              final batch = expiringBatches[index];
              final isCritical = batch['daysToExpiry'] < 7;

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                color: isCritical
                    ? AppTheme.errorColor.withOpacity(0.05)
                    : AppTheme.warningColor.withOpacity(0.05),
                child: ListTile(
                  leading: Icon(
                    Icons.warning_amber_rounded,
                    color: isCritical ? AppTheme.errorColor : AppTheme.warningColor,
                    size: 32,
                  ),
                  title: Text(
                    batch['name'],
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    'Batch: ${batch['batchNumber']}\nExpires in ${batch['daysToExpiry']} days',
                  ),
                  trailing: Chip(
                    label: Text(
                      isCritical ? 'CRITICAL' : 'WARNING',
                      style: const TextStyle(fontSize: 11),
                    ),
                    backgroundColor: isCritical
                        ? AppTheme.errorColor
                        : AppTheme.warningColor,
                    labelStyle: const TextStyle(color: Colors.white),
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 80,
            color: AppTheme.successColor,
          ),
          const SizedBox(height: 16),
          Text(
            'No expiring medicines',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'All medicines are within safe expiry dates',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getExpiringBatches() {
    return [
      {
        'name': 'Ibuprofen 400mg',
        'batchNumber': 'BATCH003',
        'daysToExpiry': 5,
      },
      {
        'name': 'Aspirin 75mg',
        'batchNumber': 'BATCH007',
        'daysToExpiry': 25,
      },
    ];
  }
}

// Search Medicine Tab
class SearchMedicineTab extends StatelessWidget {
  const SearchMedicineTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search medicine by name...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onChanged: (value) {
              // TODO: Implement search functionality
            },
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.medication_outlined,
                    size: 80,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Search for medicines',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Enter medicine name to find availability',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[500],
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
