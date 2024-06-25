# addressli
**Address** book for **Li**nux command line  
Eine kleine Adress-, Termin- und Notizverwaltung für die Kommandozeile.

**Vorbereitung**

Für die Nutzung reicht es, sich dieses Repository auf seinen Rechner herunterzuladen.  
Vor dem erstmaligen Gebrauch muss die Datei address.txt in address.lst umbenannt werden. Diese kann dann mit Daten gefüllt werden. Die Datei wird dann automatisch bei Aufruf von addressli, nach Abfrage eines Passworts, verschlüsselt.

Für dieses Programm werden die Pakete `ccrypt` zum Ver- und Entschlüsseln der address.lst, `qrencode` zum Erzeugen der QR-Codes und `gcal` für den Kalender und die Terminverwaltung benötigt.

Alle Programme kann man in einem Rutsch installieren mit:  
`sudo apt-get install ccrypt qrencode gcal at`

Für die Synchronisation (`-s`) und die Optionen `-C` und `-r` muss die Datei `config/addressli.conf` angelegt und angepasst werden. Eine Vorlagendatei befindet sich im selben Ordner.

Für die Terminverwaltung muss eine Profildatei `dates/dates.rc` angelegt werden. Auch hierfür ist im selben Ordner eine Datei mit vielen Beispielen vorhanden.

Für die kleine Notizverwaltung muss lediglich die Datei `notes/jottings.txt` angelegt werden.

Außerdem ist es sehr praktisch, sich eine symbolische Verknüpfung in einem lokalen PATH-Ordner anzulegen:  
`ln -s "${PWD}"/addressli "${HOME}"/.local/bin/addressli`  
Danach ist addressli von jedem lokalen Ordner aufrufbar.

**Synchronisation**

Möchte man die Adressdaten, Termine und Notizen mit einem Server (z.B. einem Raspi) synchronisieren, kann man sich entweder dieses Repository komplett auf den Server herunterladen oder man kopiert sich nur die relevanten Dateien (address.lst.cpt, dates.rc und jottings.txt) in einen Ordner.

Außerdem wird scp aus dem Paket `openssh` benötigt, welches jedoch bei den meisten Linux-Distributionen bereits installiert ist.  
Für die Einrichtung von SSH gibt es sehr gute Anleitungen im Internet. Eine ist zum Beispiel:
<https://wiki.ubuntuusers.de/SSH/>  

Vor dem erstmaligen Ausführen der Synchronisation (Option -s) bitte die Dateien address.lst.cpt, dates.rc und jottings.txt zwischen Client und Host 'von Hand' abgleichen und ggf. auch ein Backup der Daten machen.

**Benachrichtigungen**

Man kann die Termine des aktuellen Tages mit der Option `-r` an unterschiedliche Dienste übergeben:

`-r mail`

Hier kann man die Termine an eine E-Mail-Adresse senden. Dazu reicht es, sich einen SMTP-Client wie zum Beispiel `msmtp` zu installieren und konfigurieren. Hier eine ganz kurze Beschreibung:  
1. Paketquellen aktualisieren.  
2. Programme installieren mit `sudo apt-get install msmtp msmtp-mta mailutils`  
3. Config-Datei `~/.msmtprc` anlegen und konfigurieren.

Weiterführende Informationen:  
<https://decatec.de/linux/linux-einfach-e-mails-versenden-mit-msmtp/>  
<https://marlam.de/msmtp/documentation/>

Termine in E-Mails mit GnuPG verschlüsseln:

1. Zunächst benötigt man den öffentlichen Schlüssel der Zieladresse (E-Mail) und notiert sich den 40-stelligen Fingerprint.
2. Falls Gnupg2 noch nicht installiert ist, muss dieser Schritt noch gemacht werden: `sudo apt-get install gnupg2`
3. Danach muss der öffentliche Schlüssel der Zieladresse (Email) importiert werden: `gpg --import dateiname.asc`
4. Danach kann man die Fingerprints vergleichen. Den Fingerabdruck des gerade importierten Schlüssels erfährt man mit `gpg -k`
5. Nun muss noch dem Schlüssel vertraut werden. Sind die beiden Fingerprints identisch gibt man folgenden Befehl ein: `gpg --edit-key [40-stelliger Fingerprint]`
6. In der folgenden interaktiven Abfrage gibt man ein:  
    `trust`  
    `5` (5 = Ich vertraue ihm absolut)  
    Eingabe mit `j` bestätigen  
    `quit`
7. Anschließend die Datenbank updaten: `gpg --update-trustdb`
8. Die Verschlüsselung aktiviert man, indem man den 40-stelligen Fingerprint in die Variable `keyfingerprint` in der Datei `config/addressli.conf` einträgt. Nun sollten die Termine verschlüsselt übertragen werden.

Hinweis: Es werden nur die Termine verschlüsselt, andere Elemente der E-Mail wie zum Beispiel der Betreff bleiben unberührt und werden gemäß der Konfiguration übertragen.  
Weiterführende Informationen zur Verschlüsselung mit GnuPG:  
<https://www.gnupg.org/documentation/>  
<https://wiki.ubuntuusers.de/GnuPG/>

`-r notify`

Termine als Benachrichtigungen mit `notify-send` auf dem Desktop ausgeben.

Außerdem kann man für beide Options-Möglichkeiten (`mail` bzw. `notify`) Terminerinnerungen ausgeben lassen.
Dazu muss lediglich die Variable remind in der Datei `config/addressli.conf` auf `yes` gesetzt werden. Näheres dazu ist in der .conf-Datei beschrieben.  
Das Programm `at` wird für die Terminerinnerung benötigt.

**Beispiele**

Mit der Option `-n vcf` können neue Datensätze für Adressen hinzugefügt werden.

Die Hilfe ruft man mit der Option `-h` auf.

Die Nutzung ist denkbar einfach. Zur Ausgabe einer Adresse braucht man nur den Nachnamen und ggf. den Vornamen angeben. Also:

    addressli Nachname

oder:

    addressli Nachname Vorname

Viel Spass mit diesem kleinen Programm.
