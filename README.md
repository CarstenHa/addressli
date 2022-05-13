# addressli
**Address** book for **Li**nux command line

Vor dem erstmaligen Gebrauch muss die Datei address.txt in address.lst umbenannt werden. Diese kann dann mit Daten gefüllt werden. Die Datei wird dann automatisch bei Aufruf von addressli, nach Abfrage eines Passworts, verschlüsselt.

Für dieses Programm werden die Pakete `ccrypt` zum Ver- und Entschlüsseln der address.lst, `qrencode` zum Erzeugen der QR-Codes und `gcal` für den Kalender und die Terminverwaltung benötigt.

Alle Programme kann man in einem Rutsch installieren mit:  
`sudo apt-get install ccrypt qrencode gcal`

Möchte man die Daten mit einem Server (z.B. einem Raspi) synchronisieren, wird außerdem scp aus dem Paket `openssh` benötigt, welches jedoch bei den meisten Linux-Distributionen bereits installiert ist.  
Für die Synchronisation und die Option `-C` muss die Datei `config/addressli.conf` angelegt und angepasst werden. Eine Vorlagendatei befindet sich im selben Ordner.  
Für die Einrichtung von SSH gibt es sehr gute Anleitungen im Internet. Eine ist zum Beispiel:
<https://wiki.ubuntuusers.de/SSH/>

Für die Terminverwaltung muss eine Profildatei `dates/dates.rc` angelegt werden. Auch hierfür ist im selben Ordner eine Datei mit vielen Beispielen vorhanden.

Mit der Option `-n vcf` können neue Datensätze für Adressen hinzugefügt werden.

Die Hilfe ruft man mit der Option `-h` auf.

Die Nutzung ist denkbar einfach. Zur Ausgabe einer Adresse braucht man nur den Nachnamen und ggf. den Vornamen angeben. Also:

    addressli Nachname
oder:

    addressli Nachname Vorname

Viel Spass mit diesem kleinen Programm.