

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/event_list/data/repositories/ticketmaster_repository.dart';
import '../../features/event_list/presentation/bloc/cubit/event_cubit.dart';

class GlobalCubits{
  static List<BlocProvider<dynamic>> getCubits() {
    
    return[
      BlocProvider<EventCubit>(create: (_) => EventCubit( repository: TicketmasterRepository()))
    ];

  }
}