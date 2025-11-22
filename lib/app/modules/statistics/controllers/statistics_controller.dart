import 'package:get/get.dart';

class StatisticsController extends GetxController {
  //TODO: Implement StatisticsController

  final count = 0.obs;
  final selectedTab = 0.obs; // 0: Hari, 1: Minggu, 2: Bulan
  final selectedNutrient = 'Kalori'.obs;
  final touchedIndex = (-1).obs;
  final selectedDayIndex = (-1).obs; // -1 berarti tidak ada yang dipilih

  final List<String> nutrients = ['Kalori', 'Protein', 'Karbohidrat', 'Lemak'];
  final List<String> weekDays = [
    'Min',
    'Sen',
    'Sel',
    'Rab',
    'Kam',
    'Jum',
    'Sab',
  ];

  // Data untuk pie chart (contoh data)
  Map<String, Map<String, dynamic>> get nutritionData => {
    'Kalori': {
      'total': 2000,
      'consumed': 1500,
      'sections': [
        {'label': 'Sarapan', 'value': 500},
        {'label': 'Makan Siang', 'value': 600},
        {'label': 'Makan Malam', 'value': 400},
      ],
    },
    'Protein': {
      'total': 150,
      'consumed': 100,
      'sections': [
        {'label': 'Sarapan', 'value': 30},
        {'label': 'Makan Siang', 'value': 45},
        {'label': 'Makan Malam', 'value': 25},
      ],
    },
    'Karbohidrat': {
      'total': 300,
      'consumed': 220,
      'sections': [
        {'label': 'Sarapan', 'value': 80},
        {'label': 'Makan Siang', 'value': 90},
        {'label': 'Makan Malam', 'value': 50},
      ],
    },
    'Lemak': {
      'total': 70,
      'consumed': 50,
      'sections': [
        {'label': 'Sarapan', 'value': 15},
        {'label': 'Makan Siang', 'value': 20},
        {'label': 'Makan Malam', 'value': 15},
      ],
    },
  };

  // Data untuk bar chart mingguan
  Map<String, Map<String, dynamic>> get weeklyNutritionData => {
    'Kalori': {
      'total': 2000,
      'days': [
        {
          'day': 'Minggu',
          'value': 1800,
          'percentage': 0.9,
          'breakdown': [
            {'label': 'Sarapan', 'value': 600},
            {'label': 'Makan Siang', 'value': 700},
            {'label': 'Makan Malam', 'value': 500},
          ],
        },
        {
          'day': 'Senin',
          'value': 1500,
          'percentage': 0.75,
          'breakdown': [
            {'label': 'Sarapan', 'value': 500},
            {'label': 'Makan Siang', 'value': 600},
            {'label': 'Makan Malam', 'value': 400},
          ],
        },
        {
          'day': 'Selasa',
          'value': 1200,
          'percentage': 0.6,
          'breakdown': [
            {'label': 'Sarapan', 'value': 400},
            {'label': 'Makan Siang', 'value': 500},
            {'label': 'Makan Malam', 'value': 300},
          ],
        },
        {
          'day': 'Rabu',
          'value': 1600,
          'percentage': 0.8,
          'breakdown': [
            {'label': 'Sarapan', 'value': 550},
            {'label': 'Makan Siang', 'value': 650},
            {'label': 'Makan Malam', 'value': 400},
          ],
        },
        {
          'day': 'Kamis',
          'value': 1400,
          'percentage': 0.7,
          'breakdown': [
            {'label': 'Sarapan', 'value': 450},
            {'label': 'Makan Siang', 'value': 550},
            {'label': 'Makan Malam', 'value': 400},
          ],
        },
        {
          'day': 'Jumat',
          'value': 1100,
          'percentage': 0.55,
          'breakdown': [
            {'label': 'Sarapan', 'value': 350},
            {'label': 'Makan Siang', 'value': 450},
            {'label': 'Makan Malam', 'value': 300},
          ],
        },
        {
          'day': 'Sabtu',
          'value': 1900,
          'percentage': 0.95,
          'breakdown': [
            {'label': 'Sarapan', 'value': 650},
            {'label': 'Makan Siang', 'value': 750},
            {'label': 'Makan Malam', 'value': 500},
          ],
        },
      ],
    },
    'Protein': {
      'total': 150,
      'days': [
        {
          'day': 'Minggu',
          'value': 120,
          'percentage': 0.8,
          'breakdown': [
            {'label': 'Sarapan', 'value': 40},
            {'label': 'Makan Siang', 'value': 50},
            {'label': 'Makan Malam', 'value': 30},
          ],
        },
        {
          'day': 'Senin',
          'value': 100,
          'percentage': 0.67,
          'breakdown': [
            {'label': 'Sarapan', 'value': 30},
            {'label': 'Makan Siang', 'value': 45},
            {'label': 'Makan Malam', 'value': 25},
          ],
        },
        {
          'day': 'Selasa',
          'value': 90,
          'percentage': 0.6,
          'breakdown': [
            {'label': 'Sarapan', 'value': 25},
            {'label': 'Makan Siang', 'value': 40},
            {'label': 'Makan Malam', 'value': 25},
          ],
        },
        {
          'day': 'Rabu',
          'value': 110,
          'percentage': 0.73,
          'breakdown': [
            {'label': 'Sarapan', 'value': 35},
            {'label': 'Makan Siang', 'value': 45},
            {'label': 'Makan Malam', 'value': 30},
          ],
        },
        {
          'day': 'Kam',
          'value': 95,
          'percentage': 0.63,
          'breakdown': [
            {'label': 'Sarapan', 'value': 30},
            {'label': 'Makan Siang', 'value': 40},
            {'label': 'Makan Malam', 'value': 25},
          ],
        },
        {
          'day': 'Jum',
          'value': 85,
          'percentage': 0.57,
          'breakdown': [
            {'label': 'Sarapan', 'value': 25},
            {'label': 'Makan Siang', 'value': 35},
            {'label': 'Makan Malam', 'value': 25},
          ],
        },
        {
          'day': 'Sab',
          'value': 130,
          'percentage': 0.87,
          'breakdown': [
            {'label': 'Sarapan', 'value': 45},
            {'label': 'Makan Siang', 'value': 55},
            {'label': 'Makan Malam', 'value': 30},
          ],
        },
      ],
    },
    'Karbohidrat': {
      'total': 300,
      'days': [
        {
          'day': 'Minggu',
          'value': 250,
          'percentage': 0.83,
          'breakdown': [
            {'label': 'Sarapan', 'value': 80},
            {'label': 'Makan Siang', 'value': 100},
            {'label': 'Makan Malam', 'value': 70},
          ],
        },
        {
          'day': 'Senin',
          'value': 220,
          'percentage': 0.73,
          'breakdown': [
            {'label': 'Sarapan', 'value': 70},
            {'label': 'Makan Siang', 'value': 90},
            {'label': 'Makan Malam', 'value': 60},
          ],
        },
        {
          'day': 'Selasa',
          'value': 180,
          'percentage': 0.6,
          'breakdown': [
            {'label': 'Sarapan', 'value': 60},
            {'label': 'Makan Siang', 'value': 70},
            {'label': 'Makan Malam', 'value': 50},
          ],
        },
        {
          'day': 'Rabu',
          'value': 240,
          'percentage': 0.8,
          'breakdown': [
            {'label': 'Sarapan', 'value': 80},
            {'label': 'Makan Siang', 'value': 95},
            {'label': 'Makan Malam', 'value': 65},
          ],
        },
        {
          'day': 'Kam',
          'value': 210,
          'percentage': 0.7,
          'breakdown': [
            {'label': 'Sarapan', 'value': 70},
            {'label': 'Makan Siang', 'value': 80},
            {'label': 'Makan Malam', 'value': 60},
          ],
        },
        {
          'day': 'Jum',
          'value': 170,
          'percentage': 0.57,
          'breakdown': [
            {'label': 'Sarapan', 'value': 55},
            {'label': 'Makan Siang', 'value': 65},
            {'label': 'Makan Malam', 'value': 50},
          ],
        },
        {
          'day': 'Sab',
          'value': 270,
          'percentage': 0.9,
          'breakdown': [
            {'label': 'Sarapan', 'value': 90},
            {'label': 'Makan Siang', 'value': 110},
            {'label': 'Makan Malam', 'value': 70},
          ],
        },
      ],
    },
    'Lemak': {
      'total': 70,
      'days': [
        {
          'day': 'Minggu',
          'value': 55,
          'percentage': 0.79,
          'breakdown': [
            {'label': 'Sarapan', 'value': 18},
            {'label': 'Makan Siang', 'value': 22},
            {'label': 'Makan Malam', 'value': 15},
          ],
        },
        {
          'day': 'Senin',
          'value': 45,
          'percentage': 0.64,
          'breakdown': [
            {'label': 'Sarapan', 'value': 15},
            {'label': 'Makan Siang', 'value': 18},
            {'label': 'Makan Malam', 'value': 12},
          ],
        },
        {
          'day': 'Selasa',
          'value': 40,
          'percentage': 0.57,
          'breakdown': [
            {'label': 'Sarapan', 'value': 12},
            {'label': 'Makan Siang', 'value': 16},
            {'label': 'Makan Malam', 'value': 12},
          ],
        },
        {
          'day': 'Rabu',
          'value': 50,
          'percentage': 0.71,
          'breakdown': [
            {'label': 'Sarapan', 'value': 16},
            {'label': 'Makan Siang', 'value': 20},
            {'label': 'Makan Malam', 'value': 14},
          ],
        },
        {
          'day': 'Kam',
          'value': 48,
          'percentage': 0.69,
          'breakdown': [
            {'label': 'Sarapan', 'value': 15},
            {'label': 'Makan Siang', 'value': 19},
            {'label': 'Makan Malam', 'value': 14},
          ],
        },
        {
          'day': 'Jum',
          'value': 38,
          'percentage': 0.54,
          'breakdown': [
            {'label': 'Sarapan', 'value': 12},
            {'label': 'Makan Siang', 'value': 15},
            {'label': 'Makan Malam', 'value': 11},
          ],
        },
        {
          'day': 'Sab',
          'value': 60,
          'percentage': 0.86,
          'breakdown': [
            {'label': 'Sarapan', 'value': 20},
            {'label': 'Makan Siang', 'value': 24},
            {'label': 'Makan Malam', 'value': 16},
          ],
        },
      ],
    },
  };

  void changeTab(int index) {
    selectedTab.value = index;
    selectedDayIndex.value = -1; // Reset selected day when changing tab
  }

  void changeNutrient(String? nutrient) {
    if (nutrient != null) {
      selectedNutrient.value = nutrient;
      selectedDayIndex.value = -1; // Reset selected day when changing nutrient
    }
  }

  void setTouchedIndex(int index) {
    touchedIndex.value = index;
  }

  void toggleDaySelection(int index) {
    if (selectedDayIndex.value == index) {
      selectedDayIndex.value = -1; // Unselect if already selected
    } else {
      selectedDayIndex.value = index; // Select the day
    }
  }

  // Get unit based on selected nutrient
  String get currentUnit {
    switch (selectedNutrient.value) {
      case 'Kalori':
        return 'kkal';
      case 'Protein':
        return 'g';
      case 'Karbohidrat':
        return 'g';
      case 'Lemak':
        return 'g';
      default:
        return '';
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
