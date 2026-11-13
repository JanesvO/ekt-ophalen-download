# EKT Ophalen

Windows-programma dat automatisch op een vast interval EKT-berichten uit een mailbox ophaalt: de bijlagen worden opgeslagen in een map van jouw keuze en de verwerkte mail wordt daarna verwijderd.

- Mailaccount (IMAP) en uitvoermap zelf in te stellen
- Instelbaar interval, bijvoorbeeld elke 15 minuten
- Bijlagen krijgen een nieuwe extensie (standaard `.txt`) en de naam `JJJJMMDD_<mail-nr>_<naam>.txt`
- Een mail wordt alleen verwijderd als alle bijlagen goed zijn opgeslagen
- Je wachtwoord wordt versleuteld bewaard (Windows DPAPI, alleen leesbaar voor jouw Windows-account)

Gemaakt door **[JvO ICT](https://jvoict.nl/)**.

## Installeren

Je hebt Windows 10 of 11 nodig. Beheerdersrechten en Python zijn niet nodig.

### Optie A: met één opdracht

1. Druk op **Start**, typ `PowerShell` en open **Windows PowerShell**.
2. Plak deze regel en druk op **Enter**:

   ```powershell
   irm https://raw.githubusercontent.com/JanesvO/ekt-ophalen-download/main/get.ps1 | iex
   ```

3. Wacht tot de melding dat het programma is geïnstalleerd. Je vindt **EKT Ophalen** daarna in het Startmenu en op het bureaublad.

Dezelfde opdracht werkt ook om later bij te werken. Je instellingen blijven bewaard.

### Optie B: via een ZIP-bestand (zonder PowerShell)

1. Ga naar [**Releases**](https://github.com/JanesvO/ekt-ophalen-download/releases/latest) en download **EKTOphalen.zip**.
2. Klik met de rechtermuisknop op het ZIP-bestand en kies **Alles uitpakken…**.
3. Open de uitgepakte map **EKTOphalen** en dubbelklik op **`Install.cmd`**.
4. Wacht tot het venster meldt dat het programma is geïnstalleerd en druk op een toets.

> Windows SmartScreen kan "Onbekende uitgever" melden. Kies dan **Meer informatie** en daarna **Toch uitvoeren**.

## Gebruik

1. Vul bij **Mailaccount** de server, poort, versleuteling, gebruikersnaam en het wachtwoord in en klik op **Verbinding testen**.
2. Kies de **uitvoermap** voor de bijlagen.
3. Stel in **Automatisch ophalen** het aantal minuten in en klik op **▶ Start**. Met **Nu ophalen** haal je direct één keer op.
4. Het programma moet open blijven staan om te blijven ophalen. Zet bij "Direct starten" een vinkje als je wilt dat het bij het openen meteen begint.

> **Let op:** met "Mail permanent verwijderen" aan gaat de mail definitief weg (niet naar de prullenbak). Gebruik daarom een eigen mailbox voor dit doel.

Het logboek staat in `%APPDATA%\JvO ICT\EKTOphalen\ophalen.log`.

## Verwijderen

Verwijder de map `%LOCALAPPDATA%\Programs\EKTOphalen` en de snelkoppelingen. Instellingen staan in `%APPDATA%\JvO ICT\EKTOphalen`.
