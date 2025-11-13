import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_export.dart';
import './widgets/achievement_banner_widget.dart';
import './widgets/educational_carousel_widget.dart';
import './widgets/greeting_header_widget.dart';
import './widgets/quick_stats_widget.dart';
import './widgets/recent_activity_widget.dart';
import './widgets/schedule_pickup_card_widget.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({Key? key}) : super(key: key);

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard>
    with TickerProviderStateMixin {
  int _currentTabIndex = 0;
  Map<String, dynamic>? _currentAchievement;
  bool _isRefreshing = false;

  // Mock data
  final List<Map<String, dynamic>> _recentActivities = [
    {
      "id": "12345",
      "date": "Nov 12, 2025",
      "status": "Completed",
      "items": "Paper, Cardboard, Plastic bottles",
      "weight": "5.2 kg",
      "earnings": "\$12.50",
    },
    {
      "id": "12344",
      "date": "Nov 10, 2025",
      "status": "In-Progress",
      "items": "Metal cans, Electronics",
      "weight": "3.8 kg",
      "earnings": "\$18.75",
    },
    {
      "id": "12343",
      "date": "Nov 8, 2025",
      "status": "Pending",
      "items": "Glass bottles, Newspapers",
      "weight": "2.1 kg",
      "earnings": "\$6.25",
    },
  ];

  final List<Map<String, dynamic>> _educationalContent = [
    {
      "category": "Paper",
      "title": "Paper & Cardboard Collection",
      "description":
          "Clean paper and cardboard materials are highly recyclable and valuable.",
      "priceRange": "\$0.10-0.15/kg",
      "image":
          "https://images.unsplash.com/photo-1610552915282-f120cfe28b2a",
      "semanticLabel":
          "Stack of folded cardboard boxes and paper materials ready for recycling collection",
      "tip": "Remove tape and staples for better pricing",
    },
    {
      "category": "Metal",
      "title": "Metal Scrap Collection",
      "description":
          "Aluminum cans, copper, and steel have excellent recycling value.",
      "priceRange": "\$0.50-2.00/kg",
      "image":
          "https://images.unsplash.com/photo-1699058677860-642b700fc984",
      "semanticLabel":
          "Collection of various metal scraps including aluminum cans and copper pieces in recycling bins",
      "tip": "Separate different metals for maximum value",
    },
    {
      "category": "Electronics",
      "title": "E-Waste Recycling",
      "description":
          "Old phones, computers, and electronics contain valuable materials.",
      "priceRange": "\$5-50/item",
      "image":
          "https://images.unsplash.com/photo-1719699485614-6d77f6103693",
      "semanticLabel":
          "Pile of old electronic devices including smartphones, tablets, and computer parts for e-waste recycling",
      "tip": "Remove batteries and personal data first",
    },
    {
      "category": "Plastic",
      "title": "Plastic Bottle Collection",
      "description":
          "Clean plastic bottles and containers are in high demand for recycling.",
      "priceRange": "\$0.20-0.30/kg",
      "image":
          "https://images.unsplash.com/photo-1638929935038-94137b62f315",
      "semanticLabel":
          "Collection of clean plastic bottles and containers sorted by type for recycling pickup",
      "tip": "Rinse containers and remove labels",
    },
  ];

  @override
  void initState() {
    super.initState();
    _checkForAchievements();
  }

  void _checkForAchievements() {
    // Simulate achievement check
    if (_recentActivities
            .where((activity) => activity['status'] == 'Completed')
            .length >=
        1) {
      setState(() {
        _currentAchievement = {
          "icon": "eco",
          "title": "Eco Warrior",
          "description": "Completed your first pickup!",
        };
      });
    }
  }

  Future<void> _onRefresh() async {
    setState(() {
      _isRefreshing = true;
    });

    // Simulate network call
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isRefreshing = false;
    });
  }

  void _onActivityTap(Map<String, dynamic> activity) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildActivityBottomSheet(activity),
    );
  }

  Widget _buildActivityBottomSheet(Map<String, dynamic> activity) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: AppTheme.lightTheme.colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            width: 10.w,
            height: 0.5.h,
            margin: EdgeInsets.symmetric(vertical: 2.h),
            decoration: BoxDecoration(
              color: AppTheme.lightTheme.colorScheme.outline
                  .withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pickup Details',
                    style:
                        AppTheme.lightTheme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  _buildDetailRow('Pickup ID', '#${activity['id']}'),
                  _buildDetailRow('Date', activity['date'] as String),
                  _buildDetailRow('Status', activity['status'] as String),
                  _buildDetailRow('Items', activity['items'] as String),
                  _buildDetailRow('Weight', activity['weight'] as String),
                  _buildDetailRow('Earnings', activity['earnings'] as String),
                  SizedBox(height: 3.h),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // Navigate to repeat request
                          },
                          child: Text('Repeat Request'),
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // Navigate to receipt
                          },
                          child: Text('View Receipt'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 25.w,
            child: Text(
              label,
              style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                color: AppTheme.lightTheme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          color: AppTheme.lightTheme.colorScheme.primary,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    GreetingHeaderWidget(
                      userName: "Sarah",
                      location: "Downtown, San Francisco",
                      weatherCondition: "Sunny",
                    ),
                    AchievementBannerWidget(
                      achievement: _currentAchievement,
                      onDismiss: () {
                        setState(() {
                          _currentAchievement = null;
                        });
                      },
                    ),
                    SchedulePickupCardWidget(
                      onTap: () => Navigator.pushNamed(
                          context, '/create-pickup-request'),
                    ),
                    QuickStatsWidget(
                      earnedCredits: 245,
                      completedPickups: 12,
                      environmentalImpact: 28.5,
                    ),
                    RecentActivityWidget(
                      activities: _recentActivities,
                      onActivityTap: _onActivityTap,
                    ),
                    EducationalCarouselWidget(
                      educationalContent: _educationalContent,
                    ),
                    SizedBox(height: 10.h), // Bottom padding for FAB
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/create-pickup-request'),
        icon: CustomIconWidget(
          iconName: 'add',
          color: AppTheme.lightTheme.floatingActionButtonTheme.foregroundColor!,
          size: 24,
        ),
        label: Text(
          'New Pickup',
          style: AppTheme.lightTheme.textTheme.labelLarge?.copyWith(
            color:
                AppTheme.lightTheme.floatingActionButtonTheme.foregroundColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor:
            AppTheme.lightTheme.floatingActionButtonTheme.backgroundColor,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        onTap: (index) {
          setState(() {
            _currentTabIndex = index;
          });

          switch (index) {
            case 0:
              // Already on home
              break;
            case 1:
              Navigator.pushNamed(context, '/pickup-history');
              break;
            case 2:
              Navigator.pushNamed(context, '/real-time-tracking');
              break;
            case 3:
              // Navigate to profile (not implemented)
              break;
          }
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: CustomIconWidget(
              iconName: 'home',
              color: _currentTabIndex == 0
                  ? AppTheme
                      .lightTheme.bottomNavigationBarTheme.selectedItemColor!
                  : AppTheme
                      .lightTheme.bottomNavigationBarTheme.unselectedItemColor!,
              size: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: CustomIconWidget(
              iconName: 'list_alt',
              color: _currentTabIndex == 1
                  ? AppTheme
                      .lightTheme.bottomNavigationBarTheme.selectedItemColor!
                  : AppTheme
                      .lightTheme.bottomNavigationBarTheme.unselectedItemColor!,
              size: 24,
            ),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: CustomIconWidget(
              iconName: 'location_on',
              color: _currentTabIndex == 2
                  ? AppTheme
                      .lightTheme.bottomNavigationBarTheme.selectedItemColor!
                  : AppTheme
                      .lightTheme.bottomNavigationBarTheme.unselectedItemColor!,
              size: 24,
            ),
            label: 'Tracking',
          ),
          BottomNavigationBarItem(
            icon: CustomIconWidget(
              iconName: 'person',
              color: _currentTabIndex == 3
                  ? AppTheme
                      .lightTheme.bottomNavigationBarTheme.selectedItemColor!
                  : AppTheme
                      .lightTheme.bottomNavigationBarTheme.unselectedItemColor!,
              size: 24,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
