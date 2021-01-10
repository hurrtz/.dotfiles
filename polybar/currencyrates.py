#!/usr/bin/python
# -*- coding: utf-8 -*-

import json,sys,urllib.request

if len(sys.argv) != 3:
    print("Usage: ./currencyrates.py comma_separated_currency_list base_currency. Example: ./currencyrates.py usd,eur,btc nok")
    sys.exit()

currencies = sys.argv[1]
basecurrency = sys.argv[2]

currencyurl = "http://freecurrencyrates.com/api/action.php?do=cvals&iso=" + currencies.replace(',','') + "&f=" + basecurrency + "&v=1&s=cbr"

with urllib.request.urlopen(currencyurl) as response:
  f = response
  obj = json.loads(f.read())

res="";

for c in currencies.split(','):
    res += c.upper() + " {:,.0f}".format(1/obj[c.upper()]).replace(',','.')

# some unicode currency code replacement (optional)
res = res.replace("USD", "$")
res = res.replace("EUR", "€")
res = res.replace("BTC", "")
res = res.replace("ETH", "")

sys.stdout.write(res);
