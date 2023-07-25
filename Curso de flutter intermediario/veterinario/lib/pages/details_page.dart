import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/scheduling_controller.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final schedulingController = Provider.of<SchedulingController>(context);
    final confirmedAppointments = schedulingController.confirmedAppointments;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Consultas Agendadas',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Manrope',
          ),
        ),
        backgroundColor: const Color(0xFF757EFA),
      ),
      body: confirmedAppointments.isEmpty
          ? const Center(
              child: Text('Nenhuma consulta agendada.'),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: confirmedAppointments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        confirmedAppointments[index].veterinarian.imagePath,
                      ),
                      radius: 30,
                    ),
                    title: Text(
                      confirmedAppointments[index].veterinarian.name,
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
                          'Data: ${confirmedAppointments[index].selectedDate}',
                          style: const TextStyle(
                            color: Color(0xFF9CA8FB),
                            fontSize: 12,
                            fontFamily: 'Manrope',
                          ),
                        ),
                        Text(
                          'Horário: ${confirmedAppointments[index].selectedTime}',
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
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                'Cancelar Consulta',
                                style: TextStyle(
                                  color: Color(0xFF757EFA),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: const Text(
                                'Você tem certeza que deseja cancelar esta consulta?',
                                style: TextStyle(
                                  color: Color(0xFF9CA8FB),
                                  fontSize: 12,
                                  fontFamily: 'Manrope',
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text(
                                    'Sim',
                                    style: TextStyle(
                                      color: Color(0xFF9CA8FB),
                                      fontSize: 12,
                                      fontFamily: 'Manrope',
                                    ),
                                  ),
                                  onPressed: () {
                                    schedulingController
                                        .cancelAppointment(index);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text(
                                    'Não',
                                    style: TextStyle(
                                      color: Color(0xFF9CA8FB),
                                      fontSize: 12,
                                      fontFamily: 'Manrope',
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
    );
  }
}
