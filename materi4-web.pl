:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/html_write)).
:- use_module(library(persistency)).

% Inisialisasi basis data
:- persistent(
    profil(username:atom, nama:atom, email:atom, pekerjaan:atom)
).

% Pilih lokasi penyimpanan basis data
:- db_attach('profil.db', []).

% Handler untuk halaman beranda
:- http_handler(root(.), home_handler, []).

% Handler untuk halaman profil
:- http_handler(root(profil), profil_handler, []).

% Handler untuk halaman tambah profil
:- http_handler(root(tambah_profil), tambah_profil_handler, []).

% Handler untuk menangani permintaan yang tidak ditemukan
:- http_handler(root(.),
                http_404([method(Method), location(Relative)]),
                [method(Method), prefix]).

% Membuat halaman HTML untuk beranda
home_handler(_Request) :-
    reply_html_page(
        title('Beranda'),
        [ h1('Selamat Datang di Website Profil'),
          p('Silakan jelajahi website kami.'),
          p('Kunjungi halaman profil untuk melihat profil pengguna.'),
          p('Untuk menambahkan profil, kunjungi halaman tambah profil.')
        ]
    ).

% Membuat halaman HTML untuk profil
profil_handler(Request) :-
    http_parameters(Request, [username(Username, [])]),
    (   profil(Username, Nama, Email, Pekerjaan)
    ->  reply_html_page(
            title('Profil Pengguna'),
            [ h1('Profil Pengguna'),
              p(['Nama: ', Nama]),
              p(['Username: ', Username]),
              p(['Email: ', Email]),
              p(['Pekerjaan: ', Pekerjaan])
            ]
        )
    ;   reply_html_page(
            title('Profil Tidak Ditemukan'),
            [ h1('Profil Tidak Ditemukan'),
              p(['Profil dengan username ', Username, ' tidak ditemukan.'])
            ]
        )
    ).

% Membuat halaman HTML untuk menambah profil
tambah_profil_handler(_Request) :-
    reply_html_page(
        title('Tambah Profil'),
        [ h1('Tambah Profil'),
          form([action='/submit_profil', method='POST'],
               [ p(['Username: ', input([type='text', name='username'])]),
                 p(['Nama: ', input([type='text', name='nama'])]),
                 p(['Email: ', input([type='email', name='email'])]),
                 p(['Pekerjaan: ', input([type='text', name='pekerjaan'])]),
                 p(input([type='submit', value='Tambah']))
               ])
        ]
    ).

% Handler untuk menyimpan profil yang ditambahkan
:- http_handler(root(submit_profil), submit_profil_handler, [method(post)]).

submit_profil_handler(Request) :-
    http_parameters(Request, [username(Username, []), nama(Nama, []), email(Email, []), pekerjaan(Pekerjaan, [])]),
    assert_profil(Username, Nama, Email, Pekerjaan),
    reply_html_page(
        title('Profil Ditambahkan'),
        [ h1('Profil Ditambahkan'),
          p(['Profil dengan username ', Username, ' berhasil ditambahkan.']),
          p('Kembali ke halaman '),
          a([href('/profil?username='), Username], 'profil'),
          p('.')
        ]
    ).

% Menangani permintaan HTTP yang tidak ditemukan
http_404(Request) :-
    memberchk(method(Method), Request),
    memberchk(location(Relative), Request),
    format('Content-type: text/plain~n~n'),
    format('404 Not Found: ~w ~w~n', [Method, Relative]).

% Menjalankan server pada port tertentu
server(Port) :-
    http_server(http_dispatch, [port(Port)]).

% Contoh penggunaan: menjalankan server pada port 8000
:- initialization(server(8000)).