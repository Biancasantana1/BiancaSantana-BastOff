import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/scheduling_controller.dart';

class SchedulingConfirmationPage extends StatelessWidget {
  const SchedulingConfirmationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final schedulingController = Provider.of<SchedulingController>(context);
    final appointments = schedulingController.schedules;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF757EFA),
        title: const Text(
          'Confirmação de Agendamento',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Manrope',
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
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
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Data: ${appointments[index].selectedDate}',
                          style: const TextStyle(
                            color: Color(0xFF9CA8FB),
                            fontSize: 12,
                            fontFamily: 'Manrope',
                          ),
                        ),
                        Text(
                          'Horário: ${appointments[index].selectedTime}',
                          style: const TextStyle(
                            color: Color(0xFF9CA8FB),
                            fontSize: 12,
                            fontFamily: 'Manrope',
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
            ),
          ),
          Container(
            width: double.infinity,
            height: 70,
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF757EFA),
              ),
              child: const Text(
                'Confirmar Agendamento',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Manrope',
                ),
              ),
              onPressed: () {
                schedulingController.confirmAllSchedules();
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
