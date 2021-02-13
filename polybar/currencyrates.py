#!/usr/bin/python
# -*- coding: utf-8 -*-

import json,sys,urllib

currencies = sys.argv[1]
basecurrency = sys.argv[2]
floatingPrecision = sys.argv[3] if len(sys.argv) >= 4 else "2"

currencyurl = "http://freecurrencyrates.com/api/action.php?do=cvals&iso=" + currencies.replace(',','-') + "&f=" + basecurrency + "&v=1&s=cbr"
f = urllib.urlopen(currencyurl)
obj = json.loads(f.read())
res="";
for c in currencies.split(','):
    res += c.upper() + (" {:,." + floatingPrecision + "f}").format(1/obj[c.upper()]).replace(',','.')

# some unicode currency code replacement (optional)
res = res.replace("USD", "$")
res = res.replace("EUR", "€")
res = res.replace("GBP", "£")
res = res.replace("BTC", "")
res = res.replace("ETH", "")
res = res.replace("DOGE", "")

sys.stdout.write(res);
