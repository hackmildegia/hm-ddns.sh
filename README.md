# hm-ddns
DNS dinamikoak (dyndns2) eguneratzeko bash skripta // DynDNS (dyndns2) updater script


*OVH*ren zerbitzua erabiltzeko sortua, baina beste **dyndns2** zerbitzuak erabili ahal beharko lituzke aldaketa txikiarekin// Made to use *OVH*'s service (http://guide.ovh.com/DynDns), but should work with other **dynds2** services with minimal changes.

## Instalatu
- Deskargatu `hm-ddns.sh` nahi duzun lekuan
- Exekutagarri bilakatu: `chmod +x hm-ddns.sh`
- `hm-ddns.sh`-ek *ip* izeneko fitxategian idazten du katxea, beraz `hm-ddns.sh` dagoen direktorioan idazteko baimena duela edo idatzi dezaken *ip* fitxategia dagoela segurtatu. *Log*-a nahi baduzu beste hainbeste. *Script*a exekutatzen duen erabiltzailearen baimenekin exekutatzen da, beraz, zure *home*-an sartzen baduzu *noproblemo*.
- *Script*-a moldatu behar duzu zure datuak erabiltzeko. Ireki eta aldatu lehenengo lerroetan azaltzen diren aldagaiak: `USER`, `PASS` eta `HOST`. Zer egiten ari zaren baldin badakizu besteak ere aldatu ditzakezu.

## Erabili

### Zuzenean
Zuzenean erabiltzeko exekutatu `sh hm-ddns.sh`. Lehen aldia bada *ip* fitxategia existitzen ez dela eta kexa egingo du baina dena ondo joan da, orain *ip* izeneko fitxatega izango duzu, eta ala bada, *update.log* ere bai.

### Cron
Baina zentzu gehien duen erabiltzeko era **Cron** bidez egitea da! Orduro exekutatuko dugu `hm-ddns.sh`. Goazen ba:
- Exekutatu `crontab -e`. Zein editore erabili nahi duzun galdetuko dizu agian, erabili gogokoen duzuna.
- Lerro berria idatzi: 
`0 * * * * /SKRIPTA_GORDE_DUZUN_LEKUA/hm-ddns.sh`
Adi *SKRIPTA_GORDE_DUZUN_LEKUA* aldatu behar duzula. Gorde eta itxi, *crontab* berria instalatu duela esango dizu.
Hemendik aurrera `hm-ddns.sh` orduro exekutatuko da (gailua piztuta badago), eta kanpo IP-a aldatu ezkero DynDNS domeinua eguneratuko du!

## IP Check
Webgunea baduzu oso erraza da IP⁻a eskuratzea. Sortu ondorengo PHP script-a, `ip.php` adibidez:
```php

<?php
echo $_SERVER['REMOTE_ADDR'];

```

Eta igo zure webgunera, nahi duzun tokira. Horrela `CHECK` aldagaia zurera aldatu `CHECK='http://zurewebgunea.eus/ip.php'`, adibidez, eta **15. lerroa ezabatu**.
