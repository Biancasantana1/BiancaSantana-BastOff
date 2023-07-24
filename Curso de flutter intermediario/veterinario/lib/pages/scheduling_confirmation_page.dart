import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/scheduling_controller.dart';

class SchedulingConfirmationPage extends StatelessWidget {
  const SchedulingConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final schedulingController = Provider.of<SchedulingController>(context);
    final appointments = schedulingController.schedules;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF757EFA),
        title: const Text('Confirmação de Agendamento'),
      ),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                appointments[index].veterinarian.imagePath,
              ),
              radius: 30,
            ),
            title: Text(
              appointments[index].veterinarian.name,
              style: const TextStyle(
                color: Color(0xFF757EFA),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Data: ${appointments[index].selectedDate}',
                  style: const TextStyle(
                    color: Color(0xFF9CA8FB),
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Horário: ${appointments[index].selectedTime}',
                  style: const TextStyle(
                    color: Color(0xFF9CA8FB),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Color(0xFF757EFA),
              ),
              onPressed: () {
                schedulingController.removeScheduling(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF757EFA),
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
        onPressed: () {
          schedulingController.confirmAllSchedules();
          Navigator.pop(context);
        },
      ),
    );
  }
}
