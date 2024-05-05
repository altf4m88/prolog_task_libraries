price(ekonomi, 'Bogor-Malang', 350000).
price(eksekutif, 'Bogor-Malang', 450000).
price(super_eksekutif, 'Bogor-Malang', 550000).

price(ekonomi, 'Bogor-Madiun', 300000).
price(eksekutif, 'Bogor-Madiun', 400000).
price(super_eksekutif, 'Bogor-Madiun', 450000).

price(ekonomi, 'Bogor-Surabaya', 325000).
price(eksekutif, 'Bogor-Surabaya', 425000).
price(super_eksekutif, 'Bogor-Surabaya', 525000).

price(ekonomi, 'Bogor-Yogyakarta', 250000).
price(eksekutif, 'Bogor-Yogyakarta', 350000).
price(super_eksekutif, 'Bogor-Yogyakarta', 450000).

price(ekonomi, 'Bogor-Palembang', 450000).
price(eksekutif, 'Bogor-Palembang', 550000).
price(super_eksekutif, 'Bogor-Palembang', 650000).

price(ekonomi, 'Bogor-Padang', 550000).
price(eksekutif, 'Bogor-Padang', 650000).
price(super_eksekutif, 'Bogor-Padang', 750000).

menu :-
    write('Pilih Tiket Bus'), nl,
    write('1. Ekonomi'), nl,
    write('2. Eksekutif'), nl,
    write('3. Super Eksekutif'), nl,
    write('Pilih jenis bus: '), read(BusType),
    bus_type(BusType, Type),
    write('Pilih Tujuan:'), nl,
    write('1. Bogor-Malang'), nl,
    write('2. Bogor-Madiun'), nl,
    write('3. Bogor-Surabaya'), nl,
    write('4. Bogor-Yogyakarta'), nl,
    write('5. Bogor-Palembang'), nl,
    write('6. Bogor-Padang'), nl,
    write('Pilih tujuan: '), read(DestinationChoice),
    destination(DestinationChoice, Destination),
    price(Type, Destination, Price),
    format('Harga tiket untuk ~w ke ~w adalah Rp ~d', [Type, Destination, Price]), nl.

% Helper predicates to match menu choices with types and destinations
bus_type(1, ekonomi).
bus_type(2, eksekutif).
bus_type(3, super_eksekutif).

destination(1, 'Bogor-Malang').
destination(2, 'Bogor-Madiun').
destination(3, 'Bogor-Surabaya').
destination(4, 'Bogor-Yogyakarta').
destination(5, 'Bogor-Palembang').
destination(6, 'Bogor-Padang').

% Start the program
start :-
    repeat,
    menu,
    write('Apakah Anda ingin membeli tiket lagi? (y/n): '),
    read(Another),
    (Another == 'n' -> !, write('Terima kasih!'); fail).