.\" {PTM/PB/0.1/02-02-1999/"pobierz/ustaw parametry dysku twardego"}
.\" Updated to version 4.1 2001 Andrzej M. Krzysztofowicz <ankry@pld.org.pl>
.\" Updated to version 5.2 2002 Grzegorz Go³awski <grzegol@pld.org.pl>
.\" Translation 1999,2000 Przemek Borys <pborys@dione.ids.pl>
.\" Huh... to by³ trudny kawa³ek tekstu ;)
.\" 
.TH "HDPARM" "8" "Maj 2002" "Wersja 5.2" ""
.SH "NAZWA"
hdparm \- pobierz/ustaw parametry dysku twardego
.SH "SK£ADNIA"
.B hdparm
[ opcje ] [urz±dzenie] ..
.SH "OPIS"
.BI hdparm
daje interfejs linii poleceñ do ró¿nych ioctli dysków twardych
obs³ugiwanych przez podsystem sterownika ATA/IDE. Niektóre opcje mog±
dzia³aæ prawid³owo tylko z najnowszymi j±drami. Aby uzyskaæ najlepsze wyniki,
nale¿y skompilowaæ hdparm z plikami naglówkowymi pochodz±cymi ze ¼róde³
najnowszego j±dra.
.SH "OPCJE"
Bez opcji, zak³ada siê
.IR acdgkmnru .
.TP 
.I \-a 
Pobierz/ustaw wska¼nik odczytu z wyprzedzeniem (read\-ahead) systemu plików. 
Jest to u¿ywane do
zwiêkszania wydajno¶ci w sekwencyjnych odczytach du¿ych plików poprzez
pobieranie dodatkowych bloków, w nadziei, ¿e bêd± potrzebne danemu
zadaniu. W obecnej wersji j±dra (2.0.10) domy¶lnym ustawieniem tej opcji
jest 8 sektorów (4KB). Warto¶æ ta wydaje siê byæ dobra dla wiêkszo¶ci
zastosowañ, lecz w systemach, gdzie w wiêkszo¶ci u¿ywa siê losowych
repozycjowañ plikowych, ustawienie mniejszej warto¶ci mo¿e zapewniæ lepsz±
wydajno¶æ. Poza tym, wiele sterowników IDE ma tak¿e wbudowane oddzielne
funkcje tego typu, które w wielu sytuacjach niweluj± potrzebê odczytu
z wyprzedzeniem przez system plików.
.TP 
.I \-A
W³±cz/wy³±cz w³a¶ciwo¶æ odczytu wyprzedzaj±cego (read\-lookahead) 
napêdu IDE (zwykle domy¶lnie ON \-\- w³±czon±).
.TP 
.I \-b
Pobierz/ustaw stan magistrali.
.TP 
.I \-B
Ustaw w³a¶ciwo¶ci Zaawansowanego Zarza±dzania Energi± (APM),
o ile napêd posiada wspomaganie dla niej. Ma³a warto¶æ oznacza
agresywne zarz±dzanie energi±, a du¿a lepsz± wydajno¶æ. Warto¶æ
255 wy³±czy zarz±dzanie energi± na tym dysku.
.TP 
.I \-c
Zapytaj/w³±cz obs³ugê 32\-bitowego I/O w (E)IDE. Mo¿na u¿yæ numerycznego
parametru w³±czaj±cego/wy³±czaj±cego obs³ugê:
Obecnie obs³ugiwane warto¶ci zawieraj±
.I 0
dla wy³±czenia obs³ugi 32\-bitowego I/O,
.I 1
dla w³±czenia 32\-bitowej transmisji danych,
.I 3
dla w³±czenia 32\-bitowej transmisji danych ze specjaln± sekwencj±
.I sync
wymagan± przez wiele chipsetów. Warto¶æ
.I 3
dzia³a z prawie wszystkimi 32\-bitowymi chipsetami IDE, lecz nara¿a na
dodatkowe koszty. Zauwa¿, ¿e "32\-bit" odnosi siê do transmisji poprzez
magistralê PCI lub VLB, ale tylko do karty interfejsu; wszystkie napêdy
(E)IDE maj± wci±¿ tylko 16\-bitowe po³±czenie z kart± interfejsu.
.TP 
.I \-C
Sprawd¼ obecny stan trybu zasilania IDE. Jest on zawsze jednym z
.B unknown
(dysk nie obs³uguje tego polecenia),
.B active/idle
(normalne dzia³anie),
.B standby
(tryb oszczêdzania energii, dysk siê zatrzyma³),
lub
.B sleeping
(najni¿szy tryb oszczêdzania energii, dysk jest ca³kowicie wy³±czony).
Za pomoc± opcji
.BR \-S ,
.BR \-y ,
.BR \-Y ,
i
.B \-Z
mo¿na manipulowaæ trybami zasilania IDE.
.TP 
.I \-d
W³±cz/wy³±cz flagê "using_dma" (u¿ywaj±cy DMA) dla tego napêdu. Opcja ta 
dzia³a tylko z kilkoma kombinacjami napêdów i interfejsów, które obs³uguj± DMA, 
i które s± znane sterownikowi IDE.
Dobrym pomys³em jest równie¿ u¿ycie odpowiedniej opcji
.I \-X
w po³±czeniu z
.I \-d1
aby zapewniæ, ¿e sam napêd jest zaprogramowany odpowiedni tryb DMA,
choæ wiele BIOSów powinno zrobiæ to za ciebie podczas uruchamiania
komputera.
U¿ywanie DMA prawie zawsze powoduje zwiêkszenie wydajno¶ci i przepustowo¶ci
oraz zmniejsza zu¿ycie procesora. Lecz jest co najmniej kilka zestawieñ
chipsetów i dysków, dla których u¿ycie DMA nie zrobi wiêkszej ró¿nicy,
lub nawet spowolni dysk (na naprawdê spapranym sprzêcie). Ale to zale¿y.
.TP 
.I \-D
Wy³±cz/w³±cz wbudowan± w dnapêd w³a¶ciwo¶æ zarz±dzania uszkodzeniami, za
pomoc± której jego firmware próbuje automatycznie zarz±dzaæ uszkodzonymi
sektorami, przenosz±c je na sektory "zapasowe", zarezerwowane fabrycznie
do tego celu.
.TP 
.I \-E
Ustaw szybko¶æ cdrom\-u. NIE jest to konieczne do normalnego dzia³ania, gdy¿
napêd automatycznie sam prze³±cza prêdko¶ci. Jednak je¶li chcesz siê nim
bawiæ, podaj po tej opcji warto¶æ szybko¶ci, zwykle liczbê tak± jak 2 lub 4.
.TP 
.I \-f
Synchronizuj (sync) i wypró¿niaj (flush) bufory podrêczne urz±dzenia przy
wyj¶ciu.
Operacja ta jest równie¿ wykonywana jako czê¶æ pomiarów
.I \-t
i
.IR \-T .
.TP 
.I \-g
Poka¿ geometriê dysku (cylindry, g³owice, sektory), rozmiar (w
sektorach), a tak¿e przesuniêcie (w sektorach) pocz±tku urz±dzenia,
poczynaj±c od pocz±tku napêdu.
.TP 
.I \-h
Poka¿ krótk± informacjê o u¿yciu (pomoc).
.TP 
.I \-i
Poka¿ informacje identyfikacyjne, które zosta³y pobrane z napêdu podczas
startu, o ile s± one dostêpne.
Jest to w³a¶ciwo¶æ nowoczesnych napêdów IDE i mo¿e nie byæ obs³ugiwana przez
starsze urz±dzenia.
Zwracane dane mog± nie byæ aktualne, zale¿nie od czynno¶ci wykonanych po 
uruchomieniu systemu.
Pomimo tego, pokazywana jest zawsze bie¿±ca warto¶æ trybu operacji
wielosektorowych (multiple sector mode count).
Dla dok³adniejszej interpretacji informacji identyfikacyjnych, odsy³amy do
.I AT Attachment Interface for Disk Drives
(ANSI ASC X3T9.2 working draft, revision 4a, April 19/93).
.TP 
.I \-I
¯±daj informacji identyfikacji bezpo¶rednio od napêdu. Informacja jest
wy¶wietlana w nowym, rozszerzonym formacie z wiêksz± ilo¶ci± szczegó³ów,
ni¿ przy starszej opcji
.IR \-i .
Dostêpna jest tak¿e specjalna odmiana tej opcji "bez pasów bezpieczeñstwa"
.IR \-Istdin ,
która nie mo¿e byæ u¿ywana z ¿adn± inn± opcj±. Dziêki niej blok
identyfikacyjny dysku bêdzie pobrany ze standardowego wej¶cia zamiast
u¿ywania parametru /dev/hd*. Format tego bloku musi byæ
.I dok³adnie
taki sam jak w "plikach" /proc/ide/*/hd*/identify.
Ta odmiana jest przeznaczona do u¿ytku z "bibliotekami" informacji
identyfikacyjnych dysku, oraz z dyskami ATAPI, dla których standardowe
mechanizmy mog± dzia³aæ b³êdnie.
.TP 
.I \-k
Pobierz/ustaw flagê keep_settings_over_reset (zachowaj ustawienia po
resecie). Gdy ta flaga jest ustawiona, sterownik bêdzie chroni³ opcje
.I \-dmu
po miêkkim resecie.
Flaga ta domy¶lnie jest wy³±czona, aby uchroniæ napêd przed pêtlami
resetowañ, które mog³yby byæ spowodowane kommbinacjami ustawieñ
.I \-dmu
Opcja
.I \-k
powinna wiêc byæ ustawiana tylko gdy jeste¶ przekonany, ¿e to co robisz jest
dobre. Praktycznie, wszystko co trzeba zrobiæ aby przetestowaæ konfiguracjê
(przed u¿yciem \-k) to sprawdzenie czy napêd daje siê odczytaæ/zapisaæ i
czy proces nie generuje b³êdów w logach (komunikaty j±dra) (w wiêkszo¶ci
systemów zajrzyj do /var/adm/messages).
.TP 
.I \-K
Ustaw flagê keep_features_over_reset (zachowaj w³a¶ciwo¶ci po resecie).
Jej ustawienie powoduje, ¿e napêd odzyskuje po miêkkim resecie ustawienia dla
.IR \-APSWXZ .
Nie wszystkie napêdy wspieraj± tê w³a¶ciwo¶æ.
.TP 
.I \-L
Ustaw flagê blokowania drzwiczek (doorlock flag). Warto¶æ
.B 1
spowoduje zablokowanie drzwiczek niektórych wymiennych dysków twardych
(np. Syquest, ZIP, Jazz...). Z kolei warto¶æ
.B 0
spowoduje odblokowanie drzwiczek. Normalnie Linux automatycznie zarz±dza
mechanizmem blokowania drzwiczek, w zale¿no¶ci od eksploatacji dysku
(zablokowane, gdy system plików jest zamontowany). Lecz podczas zamykania
systemu mo¿e byæ to uci±¿liwe, gdy g³ówna partycja znajduje siê na dysku
wymiennym, gdy¿ partycja ta pozostaje zamontowana (w trybie
tylko\-do\-odczytu) po zamkniêciu systemu. Dziêki u¿yciu tej opcji
.B po
przemontowaniu g³ównego systemu plików w trybie tylko\-do\-odczytu mo¿liwe jest
wyjêcie kasety ze stacji po zamkniêciu systemu.
.TP 
.I \-m
Pobierz/ustaw licznik sektorów dla wielosektorowego I/O w napêdzie.
Ustawienie
.B 0
wy³±cza tê w³a¶ciwo¶æ. Tryb ten (inaczej znany jako IDE Block Mode) jest
w³a¶ciwo¶ci± wiêkszo¶ci nowoczesnych dysków twardych IDE, zezwalaj±c± na
transfer wielu sektorów na przerwanie I/O, w przeciwieñstwie do tradycyjnego
jednego sektora. Gdy w³±czona jest ta w³a¶ciwo¶æ, zazwyczaj obci±¿enie I/O
przez system zmniejsza siê o 30\-50%. W wielu systemach powoduje to tak¿e
zwiêkszenie przep³ywu danych o 5% do 50%. Mimo to, niektóre napêdy
(najbardziej zauwa¿alnie seria WD Caviar),
wydaj± siê dzia³aæ wolniej w tym trybie. Ró¿nie to jednak bywa.
Wiêkszo¶æ napêdów wspiera minimalny zestaw ustawieñ obejmuj±cy 2, 4, 8 i 16
(sektorów). Dla niektórych dysków mo¿liwe s± tak¿e wiêksze warto¶ci.
Ustawienie 16 lub 32 wydaje siê optymalnym dla wielu systemów.
Western Digital zaleca ni¿sze ustawienia od 4 do 8 na wielu z ich dysków,
a to z powodu ma³ych (32KB) buforów w napêdach i niezoptymalizowanych
algorytmów buforowania.
Opcja
.B \-i
mo¿e s³u¿yæ do znajdywania maksymalnej wspieranej warto¶ci
zainstalowanego napêdu (szukaj MaxMultSect na wyj¶ciu).
Niektóre napêdy twierdz±, ¿e wspieraj± ten tryb, lecz trac± dane przy
niektórych ustawieniach. W rzadkich wypadkach, takie b³êdy mog± spowodowaæ
\fBpowa¿ne uszkodzenie systemu plików\fP.
.TP 
.I \-M
Pobierz/ustaw warto¶æ Automatycznego Zarz±dzania G³o¶no¶ci± (Automatic
Acoustic Management \- AAM). Wiêkszo¶æ nowych dysków ma mo¿liwo¶æ zwolnienia
obrotów g³owicy aby zredukowaæ poziom ha³asu. Warto¶ci mog± byæ z przedzia³u
od 0 do 254. 128 jest najcichszym (a zatem najwolniejszym) ustawieniem,
a 254 najszybszym (i najg³o¶niejszym). Niektóre dyski maj± tylko dwa poziomy
(cichy / szybki), a inne mog± przyjmowaæ wszystkie warto¶ci od 128 do 254.
.B TA OPCJA JEST EKSPERYMANTALNA I NIEZBYT DOBRZE PRZETESTOWANA. U¯YWASZ JEJ NA W£ASNE RYZYKO.
.TP 
.I \-n
Pobierz lub ustaw flagê "ignore write errors" (ignoruj b³êdy zapisu) w
sterowniku. NIE baw siê tym bez uprzedniego zapoznania siê z kodem ¼ród³owym
sterownika.
.TP 
.I \-p
Próba przeprogramowania chipsetu interfejsu IDE na okre¶lony tryb PIO, lub
próba automatycznego dostosowania siê do "najlepszego" trybu PIO wspieranego
przez napêd. W³a¶ciwo¶æ ta jest wspierana w j±drze tylko dla kilku "znanych"
chipsetów. Niektóre chipsety IDE nie s± w stanie zmieniæ trybu PIO dla
pojedynczego napêdu; wówczas opcja ta mo¿e spowodowaæ ustawienie trybu
PIO dla
.I obydwu
napêdów. Wiele chipsetów IDE wspiera albo mniej, albo wiêcej ni¿ standardowe
6 (od 0 do 5) trybów PIO, wiêc dok³adne ustawienie szybko¶ci, które
w³a¶ciwie jest zaimplementowane, bêdzie ró¿niæ siê zale¿nie od wyrafinowania
chipsetu/sterownika.
.I U¿ywaj z wielk± ostro¿no¶ci±!
W³a¶ciwo¶æ ta nie chroni przed nierozwag±, a niepomy¶lne dzia³anie mo¿e
spowodowaæ
.I powa¿ne uszkodzenie systemu plików!
.TP 
.I \-P
Ustaw maksymalny licznik sektorów dla wewnêtrznych mechanizmów preodczytu
napêdu. Nie wszystkie napêdy wspieraj± tê w³a¶ciwo¶æ.
.TP 
.I \-q
Obs³u¿ nastêpn± opcjê cicho, nie wydaj±c komunikatów na wyj¶cie. Jest to
przydatne do zmniejszenia zamieszania na ekranie w wypadku uruchamiania z
/etc/rc.c/rc.local.
Nie mo¿na stosowaæ do opcji
.IR \-i ,
.IR \-v ,
.IR \-t ,
oraz
.IR \-T .
.TP 
.I \-Q
Ustaw g³êboko¶æ tagowanej kolejki (tagged queue) (1 lub wiêksz±), lub
wy³±cz kolejkowanie (0). Dzia³a to tylko z nowszymi j±drami serii 2.5.xx (lub
pó¼niejszych serii) i tylko z niektórymi, aktualnie wspieraj±cymi tê funkcjê
sterownikami.
.TP 
.I \-r
Pobierz/ustaw flagê read\-only (tylko do odczytu) urz±dzenia. Gdy jest
ustawiona, operacje zapisu nie s± na tym urz±dzeniu dozwolone.
.TP 
.I \-R
Zarejestruj interfejs IDE.
.B Niebezpieczne.
Zobacz opis opcji
.B \-U
aby zdobyæ wiêcej informacji.
.TP 
.I \-S
Ustaw timeout standby dla napêdu.
Warto¶æ ta jest u¿ywana przez napêd w celu uzyskania informacji o tym, jak
d³ugo oczekiwaæ (bez aktywno¶ci dyskowych) przed wy³±czeniem silnika w
celach oszczêdno¶ci mocy. W takich warunkach, dysk mo¿e potrzebowaæ do 30
sekund aby odpowiedzieæ na nag³e odwo³anie, choæ wiêkszo¶æ napêdów robi to
znacznie szybciej. Warto¶æ 0 oznacza wy³±czenie tej w³a¶ciwo¶ci. Warto¶ci od
1 do 240 okre¶laj± wielokrotno¶ci 5 sekund, czyli daj± timeouty od 5 sekund
do 20 minut. Warto¶ci od 241 do 251 okreslaj± 1 do 11 jednostek po 30 minut
dla timeoutów od 30 minut do 5.5 godzin. Warto¶æ 252 oznacza timeout 21
minut, 253 ustawia timeout zdefiniowany przez dostawcê, a 255 jest
interpretowane jako 21 minut plus 15 sekund.
.TP 
.I \-T
Dokonuj pomiarów czasu odczytów z cache dla celów porównawczych i testów
wydajno¶ciowych. Aby uzyskaæ miarodajne wyniki, operacja ta powinna byæ
powtarzana 2\-3 razy na nieaktywnym pod innymi wzglêdami systemie (bez innych
aktywnych procesów) z przynajmniej kilkoma megabajtami wolnej pamiêci.
Wy¶wietlana jest szybko¶æ odczytu bezpo¶rednio z linuksowych buforów cache,
bez dostêpu do dysku. Warto¶æ ta jest wska¼nikiem przep³ywu danych miêdzy
procesorem, cache i pamiêci± systemu.
Je¶li podano równie¿ opcjê
.IR \-t ,
to wynik zg³aszany przez operacjê
.I \-t
zostanie zmodyfikowany o czynnik koryguj±cy oparty na wyniku
.IR \-T .
.TP 
.I \-t
Dokonuj pomiarów czasu odczytów z urz±dzenia dla celów porównawczych i
testów wydajno¶ciowych. Aby uzyskaæ miarodajne wyniki, operacja ta powinna
byæ powtarzana 2\-3 razy na nieaktywnym pod innymi wzglêdami systemie (bez
innych aktywnych procesów) z przynajmniej kilkoma megabajtami wolnej
pamiêci. Wy¶wietlana jest szybko¶æ odczytu poprzez bufory cache z dysku, bez
wcze¶niejszego cache'owania danych. Warto¶æ ta jest miar± szybko¶ci, z jak±
napêd jest w stanie obs³ugiwaæ liniowe odczyty danych pod Linuksem
bez obci±¿enia zwi±zanego z systemem plików. Aby zapewniæ dok³adne pomiary,
cache jest opró¿niany za pomoc± ioctl BLKFLSBUF. Je¶li podano równie¿ opcjê
.IR \-T ,
to wynik zg³aszany przez operacjê
.I \-t
zostanie zmodyfikowany o czynnik koryguj±cy oparty na wyniku
.IR \-T .
.TP 
.I \-u
Pobierz/ustaw flagê interrupt\-unmask napêdu. Ustawienie 
.B 1
zezwala sterownikowi na niemaskowanie innych przerwañ podczas przetwarzania
przerwania dyskowego, co w znacz±cym stopniu zmniejsza czas reakcji na
Linuksa na polecenia u¿ytkownika i eliminuje b³êdy "serial port overrun".
.B U¿ywaj±c tej opcji nle¿y zachowaæ ostro¿no¶æ:
niektóre kombinacje napêdu/kontrolera nie radz± sobie dobrze z t±
w³a¶ciwo¶ci±, co mo¿e spowodowaæ
\fBpowa¿ne uszkodzenie systemu plików\fP.
Praktycznie, interfejsy
.B CMD\-640B
i
.B RZ1000
(E)IDE mog± byæ
.B niestabilne
(z powodu usterek sprzêtowych) gdy opcja ta jest u¿ywana z wersjami j±dra
wcze¶niejszymi ni¿ 2.0.13. Wy³±czenie w³a¶ciwo¶ci
.B IDE prefetch
tych interfejsów (zwykle ustawienie BIOS/CMOS) daje bezpieczne rozwi±zanie
tego problemu dla wcze¶niejszych j±der.
.TP 
.I \-U
Wyrejestruj interfejs IDE.
.B Niebezpieczne.
Do u¿ycia wraz z opcj±
.BR \-R .
Dedykowane dla sprzêtu skonstruowanego specjalnie do wymiany
"na gor±co" (hot\-swapping, bardzo rzadki!).
U¿ywaj ¶wiadomie z zachowaniem
.B szczególnej ostro¿no¶ci
gdy¿ mo¿e to ³atwo zawiesiæ lub uszkodziæ twój system.
¬ród³owa dystrybucja hdparm zawiera katalog 'contrib' z kilkoma skryptami
wspomagaj±cymi wymianê "na gor±co" na UltraBay z ThinkPad 600E.
U¿ywaj na w³asne ryzyko.
.TP 
.I \-v 
Wypisz wszystkie ustawienia, poza \-i (tak jak \-acdgkmnru dla IDE, \-gr
dla SCSI lub \-adgr dla XT). Jest to te¿ domy¶lne zachowanie, kiedy nie poda
siê ¿adnych opcji.
.TP 
.I \-w
Zresetuj urz±dzenie (NIEBEZPIECZNE). NIE u¿ywaj tej opcji. Jest ona tylko do
u¿ytku w nieoczekiwanych sytuacjach, gdy dla przywrócenia dysku do stanu
u¿ywalno¶ci i tak mo¿e byæ konieczne prze³adowanie systemu.
.TP 
.I \-W
W³±cz/wy³±cz w³a¶ciwo¶æ cache'owania zapisu w napêdach IDE (domy¶lny stan
jest nieokre¶lony i zale¿ny od modelu/producenta).
.TP 
.I \-x 
Przestaw urz±dzenie do wymiany "na gor±co" (hotswap) (NIEBEZBIECZNE).
.TP 
.I \-X 
Ustaw tryb transferu IDE dla nowszych napêdów (E)IDE/ATA.
Jest to zazwyczaj u¿ywane ³±cznie z
.I \-d1
gdy w³acza siê DMA do/z napêdu na wspieranym chipsecie interfejsu, przy czym
.I \-X mdma2
s³u¿y do wyboru trybu transferów multiword DMA mode2 a
.I \-X sdma1
do wyboru prostego trybu mode1 transferów DMA.
Na systemach, które wspieraj± UltraDMA u¿ycie
.I \-X udma2
s³u¿y do ustawiania trybu transferów UltraDMA mode2 (bêdziesz musia³
przygotowaæ wcze¶niej chipset do u¿ycia UltraDMA). Poza tym, u¿ycie tej opcji
jest
.I rzadko potrzebne
gdy¿ wiêkszo¶æ/wszystkie nowoczesne napêdy IDE domy¶lnie ustawiaj± siê w
najszybszym ze swoich trybów PIO przy w³±czaniu. Manipulowanie tym mo¿e byæ
bezcelowe i ryzykowne. Na dyskach, które wspieraj± alternatywne tryby
transferu,
.I \-X
mo¿e s³u¿yæ do prze³±czania 
.I tylko
trybu napêdu.
Przed zmian± trybu transferu, interfejs IDE powinien byæ ustawiony za pomoc±
zworek lub zaprogramowany (zobacz opcjê
.IR \-p )
do nowego trybu, aby zapobiec utracie i/lub zniszczeniu danych.
.I U¿ywaj tego ze szczególn± uwag±!
Dla trybów transferu PIO (Programmed Input/Output), u¿ywanych przez Linuksa,
warto¶æ ta jest zwyczajnie oczekiwanym numerem trybu PIO plus 8. Dlatego
warto¶æ 09 ustawia tryb PIO mode1, 10 PIO mode2, a 11 wybiera PIO mode3.
Ustawienie 00 odtwarza "domy¶lny" tryb PIO dysku, a 01 wy³±cza IORDY. Dla
UltraDMA warto¶ci± jest oczekiwany numer trybu UltraDMA plus 64.
.TP 
.I \-y
Zmu¶ napêd IDE do natychmiastowego przej¶cia w tryb mniejszego zu¿ycia
energii:
.B standby.
To najczê¶ciej powoduje zwolnienie pracy dysku. aktualny tryb mo¿e byæ
sprawdzony dziêki opcji
.IR \-C .
.TP 
.I \-Y
Zmu¶ napêd IDE do natychmiastowego przej¶cia w tryb najmniejszego zy¿ycia
energii:
.B sleep.
To kompletnie wy³±cza napêd. Aby napêd by³ dostêpny ponownie potrzebny jest
twardy lub miêkki reset (sterownik IDE Linuksa automatycznie wykona reset
gdy bêdzie potrzebny).
Aktualny tryb mo¿e byæ sprawdzony dziêki opcji
.IR \-C .
.TP 
.I \-z
Zmu¶ j±dro do ponownego odczytu tablicy partycji podanych urz±dzeñ.
.TP 
.I \-Z
Wy³±cz automatyczne funkcje oszczêdzania energii w niektórych napêdach
Seagate (modelach ST3xx?), aby uchroniæ je od wy³±czania siê w
nieoczekiwanych momentach.
.SH "B£ÊDY"
Jak zauwa¿ono powy¿ej, opcje
.B \-m sectcount
i
.B \-u 1
powinny byæ u¿ywane z ostro¿no¶ci±, najlepiej na systemie plików tylko dla
odczytu. Wiêkszo¶æ napêdów pracuje z tymi w³a¶ciwo¶ciami dobrze, lecz
zdarzaj± siê wyj±tki. System plików mo¿e wtedy ulec zniszczeniu. Pamiêtaj o
backupie przed takimi eksperymentami!
.PP 
Niektóre opcje (np. \-r dla SCSI) mog± nie dzia³aæ ze starszymi j±drami,
w których potrzebne ioctl()'e nie by³y wspierane.
.PP 
Chocia¿ to narzêdzie jest skierowane przede wszystkim do u¿ytku z 
napêdami dysków twardych (E)IDE, to czê¶æ opcji jest równie¿ prawid³owa
(i dozwolona) w u¿yciu z dyskami twardymi SCSI oraz z dyskami MFT/RLL z
interfejsem XT.
.SH "AUTOR"
.B hdparm
zosta³ napisany przez Marka Lorda <mlord@pobox.com>,
g³ównego twórcê i opiekuna sterownika (E)IDE dla Linuxa.
.PP 
Kod wy³±czaj±cy automatyczne oszczêdzanie energii w Seagate zosta³ napisany
przez Tomiego Leppikangasa <tomilepp@paju.oulu.fi>.
.SH "ZOBACZ TAK¯E"
.B AT Attachment Interface for Disk Drives,
ANSI ASC X3T9.2 working draft, revision 4a, April 19, 1993.
.PP 
.B AT Attachment Interface with Extensions (ATA\-2),
ANSI ASC X3T9.2 working draft, revision 2f, July 26, 1994.
.PP 
.B AT Attachment with Packet Interface \- 5 (ATA/ATAPI\-5),
T13\-1321D working draft, revision 3, February 29, 2000.
.PP 
.B AT Attachment with Packet Interface \- 6 (ATA/ATAPI\-6),
T13\-1410D working draft, revision 3b, February 26, 2002.
.PP 
.B Western Digital Enhanced IDE Implementation Guide,
by Western Digital Corporation, revision 5.0, November 10, 1993.
.PP 
.B Enhanced Disk Drive Specification,
by Phoenix Technologies Ltd., version 1.0, January 25, 1994.
