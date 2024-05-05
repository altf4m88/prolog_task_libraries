:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).

% Handler untuk halaman beranda
:- http_handler(root(.), home_handler, []).

% Handler untuk halaman profil
:- http_handler(root(profil), profil_handler, []).

% Handler untuk halaman sejarah
:- http_handler(root(sejarah), sejarah_handler, []).

% Handler untuk halaman program
:- http_handler(root(program), program_handler, []).

% Handler untuk halaman berita
:- http_handler(root(berita), berita_handler, []).

% Handler untuk halaman kontak
:- http_handler(root(kontak), kontak_handler, []).

% Membuat halaman HTML untuk beranda
home_handler(_Request) :-
    reply_html_page(
        title('Beranda'),
        [ h1('Selamat Datang di Website Kami'),
          p('Silakan jelajahi website kami.'),
          p('Pilih menu di atas untuk navigasi.')
        ]
    ).

% Membuat halaman HTML untuk profil
profil_handler(_Request) :-
    reply_html_page(
        title('Profil'),
        [ h1('Profil Kami'),
          p('Isi profil kami akan ditampilkan di sini.')
        ]
    ).

% Membuat halaman HTML untuk sejarah
sejarah_handler(_Request) :-
    reply_html_page(
        title('Sejarah'),
        [ h1('Sejarah Kami'),
          p('Sejarah kami akan ditampilkan di sini.')
        ]
    ).

% Membuat halaman HTML untuk program
program_handler(_Request) :-
    reply_html_page(
        title('Program'),
        [ h1('Program Kami'),
          p('Program kami akan ditampilkan di sini.')
        ]
    ).

% Membuat halaman HTML untuk berita
berita_handler(_Request) :-
    reply_html_page(
        title('Berita'),
        [ h1('Berita Terbaru'),
          p('Berita terbaru akan ditampilkan di sini.')
        ]
    ).

% Membuat halaman HTML untuk kontak
kontak_handler(_Request) :-
    reply_html_page(
        title('Kontak Kami'),
        [ h1('Kontak Kami'),
          p('Informasi kontak kami akan ditampilkan di sini.')
        ]
    ).

% Menjalankan server pada port tertentu
server(Port) :-
    http_server(http_dispatch, [port(Port)]).

% Contoh penggunaan: menjalankan server pada port 8000
:- initialization(server(8000)).