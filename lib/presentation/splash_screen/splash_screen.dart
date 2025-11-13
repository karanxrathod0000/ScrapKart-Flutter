import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  bool _showRetryOption = false;
  bool _isInitializing = true;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _initializeApp();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    _animationController.forward();
  }

  Future<void> _initializeApp() async {
    try {
      setState(() {
        _isInitializing = true;
        _showRetryOption = false;
      });

      // Simulate critical initialization tasks
      await Future.wait([
        _checkAuthenticationStatus(),
        _loadUserPreferences(),
        _initializeFirebaseServices(),
        _prepareMlModels(),
        _fetchConfigurationData(),
      ]).timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          throw Exception('Initialization timeout');
        },
      );

      // Wait for minimum splash duration
      await Future.delayed(const Duration(milliseconds: 3000));

      if (mounted) {
        _navigateToNextScreen();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isInitializing = false;
          _showRetryOption = true;
        });
      }
    }
  }

  Future<void> _checkAuthenticationStatus() async {
    // Simulate authentication check
    await Future.delayed(const Duration(milliseconds: 800));
  }

  Future<void> _loadUserPreferences() async {
    // Simulate loading user preferences
    await Future.delayed(const Duration(milliseconds: 600));
  }

  Future<void> _initializeFirebaseServices() async {
    // Simulate Firebase initialization
    await Future.delayed(const Duration(milliseconds: 1000));
  }

  Future<void> _prepareMlModels() async {
    // Simulate ML model preparation
    await Future.delayed(const Duration(milliseconds: 1200));
  }

  Future<void> _fetchConfigurationData() async {
    // Simulate configuration data fetch
    await Future.delayed(const Duration(milliseconds: 700));
  }

  void _navigateToNextScreen() {
    // Mock authentication status - in real app, check actual auth state
    final bool isAuthenticated = false; // Mock value
    final bool isFirstTime = true; // Mock value

    if (isAuthenticated) {
      Navigator.pushReplacementNamed(context, '/home-dashboard');
    } else if (isFirstTime) {
      // Navigate to onboarding (using login screen as placeholder)
      Navigator.pushReplacementNamed(context, '/login-screen');
    } else {
      Navigator.pushReplacementNamed(context, '/login-screen');
    }
  }

  void _retryInitialization() {
    _initializeApp();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Hide system status bar for immersive experience
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
      ),
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.lightTheme.colorScheme.primary,
              AppTheme.lightTheme.colorScheme.primaryContainer,
              AppTheme.lightTheme.colorScheme.secondary,
            ],
            stops: const [0.0, 0.6, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo section with animation
              Expanded(
                flex: 3,
                child: Center(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Opacity(
                          opacity: _fadeAnimation.value,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // App Logo
                              Container(
                                width: 25.w,
                                height: 25.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4.w),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.black.withValues(alpha: 0.2),
                                      blurRadius: 20,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: CustomIconWidget(
                                    iconName: 'recycling',
                                    color:
                                        AppTheme.lightTheme.colorScheme.primary,
                                    size: 12.w,
                                  ),
                                ),
                              ),
                              SizedBox(height: 3.h),
                              // App Name
                              Text(
                                'ScrapKart',
                                style: AppTheme
                                    .lightTheme.textTheme.headlineLarge
                                    ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              SizedBox(height: 1.h),
                              // Tagline
                              Text(
                                'Smart Scrap Collection',
                                style: AppTheme.lightTheme.textTheme.bodyLarge
                                    ?.copyWith(
                                  color: Colors.white.withValues(alpha: 0.9),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Loading section
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _isInitializing
                        ? _buildLoadingIndicator()
                        : _buildRetrySection(),
                    SizedBox(height: 4.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Column(
      children: [
        SizedBox(
          width: 8.w,
          height: 8.w,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.white.withValues(alpha: 0.8),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          'Initializing...',
          style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
            color: Colors.white.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildRetrySection() {
    return Column(
      children: [
        CustomIconWidget(
          iconName: 'error_outline',
          color: Colors.white.withValues(alpha: 0.8),
          size: 8.w,
        ),
        SizedBox(height: 2.h),
        Text(
          'Connection timeout',
          style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
            color: Colors.white.withValues(alpha: 0.8),
          ),
        ),
        SizedBox(height: 2.h),
        ElevatedButton(
          onPressed: _retryInitialization,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: AppTheme.lightTheme.colorScheme.primary,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.5.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.w),
            ),
          ),
          child: Text(
            'Retry',
            style: AppTheme.lightTheme.textTheme.labelLarge?.copyWith(
              color: AppTheme.lightTheme.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
