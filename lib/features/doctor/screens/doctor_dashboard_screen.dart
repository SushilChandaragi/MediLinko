import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../widgets/appointment_card.dart';
import '../../auth/screens/login_screen.dart';

class DoctorDashboardScreen extends StatefulWidget {
  const DoctorDashboardScreen({super.key});

  @override
  State<DoctorDashboardScreen> createState() => _DoctorDashboardScreenState();
}

class _DoctorDashboardScreenState extends State<DoctorDashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Dashboard'),
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
          TodayAppointmentsTab(),
          UpcomingAppointmentsTab(),
          PatientListTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Upcoming',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Patients',
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

// Today's Appointments Tab
class TodayAppointmentsTab extends StatelessWidget {
  const TodayAppointmentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Fetch today's appointments from database
    final todayAppointments = _getMockAppointments();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppTheme.doctorTheme, AppTheme.doctorTheme.withOpacity(0.8)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today\'s Schedule',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                '${todayAppointments.length} appointments',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
              ),
            ],
          ),
        ),
        Expanded(
          child: todayAppointments.isEmpty
              ? _buildEmptyState(context, 'No appointments today')
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: todayAppointments.length,
                  itemBuilder: (context, index) {
                    return AppointmentCard(
                      patientName: todayAppointments[index]['patientName'],
                      time: todayAppointments[index]['time'],
                      symptoms: todayAppointments[index]['symptoms'],
                      status: todayAppointments[index]['status'],
                      onTap: () => _viewAppointmentDetails(context, todayAppointments[index]),
                    );
                  },
                ),
        ),
      ],
    );
  }

  void _viewAppointmentDetails(BuildContext context, Map<String, dynamic> appointment) {
    // TODO: Navigate to appointment details screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('View details for ${appointment['patientName']}')),
    );
  }

  List<Map<String, dynamic>> _getMockAppointments() {
    return [
      {
        'patientName': 'John Doe',
        'time': '09:00 AM',
        'symptoms': 'Fever, Headache',
        'status': 'confirmed',
      },
      {
        'patientName': 'Jane Smith',
        'time': '10:30 AM',
        'symptoms': 'Regular Checkup',
        'status': 'confirmed',
      },
      {
        'patientName': 'Robert Johnson',
        'time': '02:00 PM',
        'symptoms': 'Back Pain',
        'status': 'pending',
      },
    ];
  }
}

// Upcoming Appointments Tab
class UpcomingAppointmentsTab extends StatelessWidget {
  const UpcomingAppointmentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Fetch upcoming appointments from database
    final upcomingAppointments = _getMockUpcomingAppointments();

    return upcomingAppointments.isEmpty
        ? _buildEmptyState(context, 'No upcoming appointments')
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: upcomingAppointments.length,
            itemBuilder: (context, index) {
              final appointment = upcomingAppointments[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppTheme.doctorTheme,
                    child: Text(
                      appointment['patientName'][0],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    appointment['patientName'],
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    '${appointment['date']} - ${appointment['time']}',
                  ),
                  trailing: Chip(
                    label: Text(
                      appointment['status'],
                      style: const TextStyle(fontSize: 12),
                    ),
                    backgroundColor: _getStatusColor(appointment['status']).withOpacity(0.2),
                  ),
                  onTap: () {
                    // TODO: Navigate to appointment details
                  },
                ),
              );
            },
          );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'confirmed':
        return AppTheme.successColor;
      case 'pending':
        return AppTheme.warningColor;
      case 'cancelled':
        return AppTheme.errorColor;
      default:
        return AppTheme.textSecondary;
    }
  }

  List<Map<String, dynamic>> _getMockUpcomingAppointments() {
    return [
      {
        'patientName': 'Alice Williams',
        'date': 'Dec 20, 2024',
        'time': '11:00 AM',
        'status': 'confirmed',
      },
      {
        'patientName': 'Bob Brown',
        'date': 'Dec 21, 2024',
        'time': '03:00 PM',
        'status': 'pending',
      },
    ];
  }
}

// Patient List Tab
class PatientListTab extends StatelessWidget {
  const PatientListTab({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Fetch patient list from database
    final patients = _getMockPatients();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search patients...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onChanged: (value) {
              // TODO: Implement patient search
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: patients.length,
            itemBuilder: (context, index) {
              final patient = patients[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppTheme.primaryColor,
                    child: Text(
                      patient['name'][0],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    patient['name'],
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text('Age: ${patient['age']} | ${patient['bloodGroup']}'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => _viewPatientProfile(context, patient),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _viewPatientProfile(BuildContext context, Map<String, dynamic> patient) {
    // TODO: Navigate to patient profile screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('View profile for ${patient['name']}')),
    );
  }

  List<Map<String, dynamic>> _getMockPatients() {
    return [
      {'name': 'John Doe', 'age': 35, 'bloodGroup': 'O+'},
      {'name': 'Jane Smith', 'age': 28, 'bloodGroup': 'A+'},
      {'name': 'Robert Johnson', 'age': 42, 'bloodGroup': 'B+'},
      {'name': 'Alice Williams', 'age': 31, 'bloodGroup': 'AB+'},
    ];
  }
}

Widget _buildEmptyState(BuildContext context, String message) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.calendar_today_outlined,
          size: 80,
          color: Colors.grey[300],
        ),
        const SizedBox(height: 16),
        Text(
          message,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey[600],
              ),
        ),
      ],
    ),
  );
}
