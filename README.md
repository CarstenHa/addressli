# addressli
**Address** book for **Li**nux command line  
Eine kleine Adress- und Terminverwaltung für die Kommandozeile.

**Vorbereitung**

Für die Nutzung reicht es, sich dieses Repository auf seinen Rechner herunterzuladen.  
Vor dem erstmaligen Gebrauch muss die Datei address.txt in address.lst umbenannt werden. Diese kann dann mit Daten gefüllt werden. Die Datei wird dann automatisch bei Aufruf von addressli, nach Abfrage eines Passworts, verschlüsselt.

Für dieses Programm werden die Pakete `ccrypt` zum Ver- und Entschlüsseln der address.lst, `qrencode` zum Erzeugen der QR-Codes und `gcal` für den Kalender und die Terminverwaltung benötigt.

Alle Programme kann man in einem Rutsch installieren mit:  
`sudo apt-get install ccrypt qrencode gcal`

Für die Synchronisation (`-s`) und die Optionen `-C` und `-r` muss die Datei `config/addressli.conf` angelegt und angepasst werden. Eine Vorlagendatei befindet sich im selben Ordner.

Für die Terminverwaltung muss eine Profildatei `dates/dates.rc` angelegt werden. Auch hierfür ist im selben Ordner eine Datei mit vielen Beispielen vorhanden.

**Synchronisation**

Möchte man die Adressdaten und Termine mit einem Server (z.B. einem Raspi) synchronisieren, kann man sich entweder dieses Repository komplett auf den Server herunterladen oder man kopiert sich nur die relevanten Dateien (address.lst.cpt,dates.rc) in einen Ordner.

Außerdem wird scp aus dem Paket `openssh` benötigt, welches jedoch bei den meisten Linux-Distributionen bereits installiert ist.  
Für die Einrichtung von SSH gibt es sehr gute Anleitungen im Internet. Eine ist zum Beispiel:
<https://wiki.ubuntuusers.de/SSH/>  

Vor dem erstmaligen Ausführen der Synchronisation (Option -s) bitte die Dateien address.lst.cpt und dates.rc zwischen Client und Host 'von Hand' abgleichen und ggf. auch ein Backup der Daten machen.

**Benachrichtigungen**

Man kann die Termine des aktuellen Tages mit der Option `-r` an unterschiedliche Dienste übergeben:

`-r mail`

Hier kann man die Termine an eine E-mail-Adresse senden. Dazu reicht es, sich einen SMTP-Client wie zum Beispiel `msmtp` zu installieren und konfigurieren. Hier eine ganz kurze Beschreibung:  
1. Paketquellen aktualisieren.  
2. Programme installieren mit `sudo apt-get install msmtp msmtp-mta mailutils`  
3. Config-Datei `~/.msmtprc` anlegen und konfigurieren.

Weiterführende Informationen:  
<https://decatec.de/linux/linux-einfach-e-mails-versenden-mit-msmtp/>  
<https://marlam.de/msmtp/documentation/>

`-r notify`

Termine als Benachrichtigungen mit `notify-send` auf dem Desktop ausgeben.

**Beispiele**

Mit der Option `-n vcf` können neue Datensätze für Adressen hinzugefügt werden.

Die Hilfe ruft man mit der Option `-h` auf.

Die Nutzung ist denkbar einfach. Zur Ausgabe einer Adresse braucht man nur den Nachnamen und ggf. den Vornamen angeben. Also:

    addressli Nachname
oder:

    addressli Nachname Vorname

Viel Spass mit diesem kleinen Programm.
