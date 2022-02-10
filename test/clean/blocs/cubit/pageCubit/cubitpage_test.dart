import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testflutter/src/clean/cubits/cubitpage/cubit/cubtiexample_cubit.dart';
import 'package:testflutter/src/clean/error/excapetion.dart';
import 'package:testflutter/src/clean/model/exmappleentity.dart';
import 'package:testflutter/src/clean/service/service_example.dart';

import '../../../../mocks/mocks.dart';

class MockEntityExample extends Mock implements ExmappleEntity {}

void main() {
  ExmappleEntity mockEntity;
  MockService mockService;

  group('Examplecubnit', () {
    mockEntity = MockEntityExample();
    mockService = MockService();
    CubtiexampleCubit exmaplecubit() =>
        CubtiexampleCubit(serviceExmple: mockService);
    late ServiceExmple serviceExmple;

    setUp(() {
      serviceExmple = MockService();
      mockService = MockService();
    });

    test('description', () {
      expect(exmaplecubit, returnsNormally);
    });
    // Este test corre una vez que se quite el Abstracts class y se utilice
    // enums para manejar los estados del cubit
    test('has correct inital  cubit state', () {
      expect(exmaplecubit().state, equals(const StatesCubit()));
    });

    blocTest<CubtiexampleCubit, StatesCubit>('Example State loading',
        setUp: () {
          when(() => mockService.getaDat('data'))
              .thenAnswer((_) => Future.value(mockEntity));
          when(() => mockEntity.name).thenReturn('data');
        },
        build: exmaplecubit,
        act: (cubit) => cubit.getDataBack(
            //StatesCubit(statess: Status.laoded)
            ),
        expect: () => [
              const StatesCubit(),
              StatesCubit(name: mockEntity, statess: Status.laoded),
            ]);

    blocTest<CubtiexampleCubit, StatesCubit>('Example State error',
        setUp: () {
          when(() => mockService.getaDat('data'))
              .thenThrow(ErrorSearchingCat());
        },
        build: exmaplecubit,
        act: (cubit) => cubit.getDataBack(
            //StatesCubit(statess: Status.laoded)
            ),
        expect: () => [
              const StatesCubit(),
              const StatesCubit(statess: Status.failure),
            ]);
  });
}

// testing with
// test('description', () {
//   expect(exmaplecubit, returnsNormally);
// });
// Este test corre una vez que se quite el Abstracts class y se utilice
// enums para manejar los estados del cubit
// test('has correct inital  cubit state', () {
//   expect(exmaplecubit().state, equals(CubtiexampleInitial()));
// });

//     blocTest<CubtiexampleCubit, CubtiexampleState>('Example State loading',
//         setUp: () {
//           when(() => mockService.getaDat('data'))
//               .thenAnswer((_) => Future.value(mockEntity));
//           when(() => mockEntity.name).thenReturn('data');
//         },
//         build: exmaplecubit,
//         act: (cubit) => cubit.getDataBack(),
//         expect: () => [
//               CubtiexampleInitial(),
//               CubtiexampleLoaded(name: mockEntity),
//             ]);

//     blocTest<CubtiexampleCubit, CubtiexampleState>('Example State error',
//         setUp: () {
//           when(() => mockService.getaDat('data'))
//               .thenThrow(ErrorSearchingCat());
//         },
//         build: exmaplecubit,
//         act: (cubit) => cubit.getDataBack(),
//         expect: () => [
//               CubtiexampleInitial(),
//               const CubtiexampleError(error: 'Error'),
//             ]);
//   });
// }
