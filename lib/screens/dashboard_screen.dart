import 'package:flutter/material.dart';
import 'package:flutter_for_college/screens/bottom_navigation_screen.dart';
import 'package:flutter_for_college/screens/employeeview_screen.dart';
import 'package:flutter_for_college/screens/image_screen.dart';
import 'listview_screen.dart';
import 'gridview_screen.dart';
import 'cardview_screen.dart';
import 'stack_layout_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple.shade400, Colors.deepPurple.shade800],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Choose an option below',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 60),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: Column(
                    children: [
                      _buildDashboardCard(
                        context,
                        title: 'ListView',
                        subtitle: 'Explore list view examples',
                        icon: Icons.list_rounded,
                        gradient: LinearGradient(
                          colors: [Colors.blue.shade400, Colors.blue.shade600],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ListViewScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildDashboardCard(
                        context,
                        title: 'GridView',
                        subtitle: 'Explore grid view examples',
                        icon: Icons.grid_view_rounded,
                        gradient: LinearGradient(
                          colors: [
                            Colors.orange.shade400,
                            Colors.orange.shade600,
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GridViewScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildDashboardCard(
                        context,
                        title: 'CardView',
                        subtitle: 'Explore card view examples',
                        icon: Icons.credit_card_rounded,
                        gradient: LinearGradient(
                          colors: [
                            Colors.green.shade400,
                            Colors.green.shade600,
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CardViewScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildDashboardCard(
                        context,
                        title: 'Stack Layout',
                        subtitle: 'Explore stack layout examples',
                        icon: Icons.layers_rounded,
                        gradient: LinearGradient(
                          colors: [Colors.pink.shade400, Colors.pink.shade600],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StackLayoutScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildDashboardCard(
                        context,
                        title: 'EmployeeView',
                        subtitle: 'Employee View layout examples',
                        icon: Icons.layers_rounded,
                        gradient: LinearGradient(
                          colors: [Colors.orange, Colors.orange.shade400],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EmployeeviewScreen(),
                            ),
                          );
                        },
                      ),

                      _buildDashboardCard(
                        context,
                        title: 'ImageView',
                        subtitle: 'Image View layout examples',
                        icon: Icons.layers_rounded,
                        gradient: LinearGradient(
                          colors: [Colors.orange, Colors.orange.shade400],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ImageScreen(),
                            ),
                          );
                        },
                      ),

                      _buildDashboardCard(
                        context,
                        title: 'ImageView',
                        subtitle: 'Image View layout examples',
                        icon: Icons.layers_rounded,
                        gradient: LinearGradient(
                          colors: [Colors.orange, Colors.orange.shade400],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigationScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Gradient gradient,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(icon, size: 40, color: Colors.white),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
