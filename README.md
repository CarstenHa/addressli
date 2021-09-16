# addressli
**Address** book for **Li**nux command line

Vor dem erstmaligen Gebrauch muss die Datei address.txt in address.lst umbenannt werden. Diese kann dann mit Daten gefüllt werden. Die Datei wird dann automatisch bei Aufruf von addressli, nach Abfrage eines Passworts, verschlüsselt.

Für dieses Programm werden die Pakete `ccrypt` zum Ver- und Entschlüsseln der address.lst und `qrencode` zum Erzeugen der QR-Codes benötigt.

Mit der Option `-n vcf` können dann neue Datensätze hinzugefügt werden.

Die Hilfe ruft man mit der Option `-h` auf.

Die Nutzung ist denkbar einfach. Zur Ausgabe einer Adresse braucht man nur den Nachnamen und ggf. den Vornamen angeben. Also:



    addressli Nachname
oder:


    addressli Nachname Vorname

Viel Spass mit diesem kleinen Programm.