say_hi(_Request) :-
        format('Content-type: text/html~n~n'),
        format('<html><head><title>Project Proposal Form</title></head><body>~n'),
        format('<h1>Project Proposal Form</h1>~n'),
        format('<h2>Kelompok 8</h2>~n'),
        format('
        <ul>
            <li>Fadhil Mauladhani</li>
            <li>Agung Prasetyo</li>
            <li>Marhaensalenindo Komara</li>
        </ul>

        <h2>Usulan Proyek Tugas</h2>
        <hr/>
        <p></p>
        <h4>Alasan : </h4>
        <p></p>
        ~n'),
        format('</body></html>').