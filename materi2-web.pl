:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_session)).

% Definisikan fakta statis
profil(john, 'John Doe', 'john@example.com', 'Software Engineer').
profil(jane, 'Jane Smith', 'jane@example.com', 'Data Scientist').

% Handler untuk halaman beranda
:- http_handler(root(.), home_handler, []).

% Handler untuk halaman profil
:- http_handler(root(profile), profile_handler, []).

% Handler untuk menangani permintaan yang tidak ditemukan
:- http_handler(root(.),
                http_404([method(Method), location(Relative)]),
                [method(Method), prefix]).

% Membuat halaman HTML untuk beranda
home_handler(_Request) :-
    reply_html_page(
        title('Beranda'),
        [ h1('Selamat Datang di Website Kami'),
          p('Silakan jelajahi website kami.'),
          p('Kunjungi halaman profil untuk melihat profil pengguna.')
        ]
    ).

% Membuat halaman HTML untuk profil pengguna
profile_handler(Request) :-
    http_parameters(Request, [username(Username, [])]),
    profil(Username, Name, Email, Occupation),
    reply_html_page(
        title('Profil Pengguna'),
        [ h1('Profil Pengguna'),
          p(['Nama: ', Name]),
          p(['Username: ', Username]),
          p(['Email: ', Email]),
          p(['Pekerjaan: ', Occupation])
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