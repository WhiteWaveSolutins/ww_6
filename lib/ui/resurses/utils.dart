import 'package:intl/intl.dart';

String convertDate({required DateTime date}) {
 return DateFormat('dd MMM, yyyy').format(date);
}
