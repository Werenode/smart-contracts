#! /bin/bash
#set -x

###
# admin:       tz1TQyYUuFbAroVARwhh5Fgqu2JE9HrvNi3a
# user_cool:   tz1dceN5Nuf8qvVQqUT6FwHxESs1fTPyoGAL
# user_wine:   tz1ZbHX1r4CjEv4E1hsShdVwywchSsr5McFm
#
# mainnet
# addressbook: KT1HQmKekWoUfA1ZDFmiSB91qxaAM8uoxkX1
# token:       KT1CSYNJ6dFcnsV4QJ6HnBFtdif8LJGPQiDM
# evse WNCooL: KT1SGoBNn5kLbLSi35xWrJWPrzSwVAMcWy1P
# evse WNPLUG: KT1JWTj5RJQTm9c9HtHWgZKmdXPisT3DCxMw
# evse WNWine: KT19b6BCikGACdN4uqffgSrwyJ19S2ySjveo
# evse WNGENA: ???
#
# florencenet
# addressbook: KT1D8w4HpRzQBv49KdjfZCKkNckE5CUHqAY6
# token:       KT19zaTSFhSAPftjH4DANABVNmsQnm3vnANi
# evse WNCooL: KT1PASw7YQoCekdWtWzXB4f41pGBReY65siq
# evse WNPLUG: KT1E9S9Bh1soTNVdDA5grUhHRbhA7z4Rw5Wh
# evse WNWine: KT1UQHhyXqTB9R2nFKHXLKSb1AxXJKxmBB4C
# evse WNGENA: KT1WXWsV8u5AyCSzny8FR4uWUQqaKrGbsD9H
###

cli=completium-cli

admin_alias=werenode_admin
user_cool_alias=user_cool
user_wine_alias=user_wine

addressbook_alias=werenode_addressbook
token_alias=werenode_token
evse_cool_alias=werenode_evse_cool
evse_plug_alias=werenode_evse_plug
evse_wine_alias=werenode_evse_wine
evse_gena_alias=werenode_evse_gena

admin=`$cli show address $admin_alias`
user_cool=`$cli show address $user_cool_alias`
user_wine=`$cli show address $user_wine_alias`

$cli set endpoint https://florencenet.smartpy.io
$cli set account $admin_alias

# Originate contracts
$cli originate ./michelson/addressbook.tz --named $addressbook_alias --init "(Pair \"$admin\" (Pair \"$admin\" (Pair {  } (Pair {  } (Pair {  } (Pair {  } { Elt \"\" 0x68747470733a2f2f776572656e6f64652e636f6d2f636f6e7472616374732f61646472657373626f6f6b2e6a736f6e }))))))" --force
$cli originate ./michelson/token.tz       --named $token_alias --init "(Pair 1000000 (Pair {  } (Pair { Elt \"$admin\" 1000000000000000000 } { Elt \"\" 0x68747470733a2f2f776572656e6f64652e636f6d2f636f6e7472616374732f746f6b656e2e6a736f6e })))" --force

# Originate evse contracts
$cli originate ./michelson/evse.tz        --named $evse_cool_alias --init "(Pair \"$admin\" (Pair \"$admin\" (Pair \"48.775379177873134,2.044936695048847\" (Pair 1 (Pair { 1 } (Pair 0 (Pair { } { Elt 1 2000 })))))))" --force
$cli originate ./michelson/evse.tz        --named $evse_plug_alias --init "(Pair \"$admin\" (Pair \"$admin\" (Pair \"48.8701025,2.2909664\" (Pair 1 (Pair { 1 } (Pair 0 (Pair { } { Elt 1 2000 })))))))" --force
$cli originate ./michelson/evse.tz        --named $evse_wine_alias --init "(Pair \"$admin\" (Pair \"$admin\" (Pair \"49.1885924,-0.3609428\" (Pair 1 (Pair { 1 } (Pair 0 (Pair { } { Elt 1 2000 })))))))" --force
$cli originate ./michelson/evse_v2.tz     --named $evse_gena_alias --init "(Pair \"$admin\" (Pair \"$admin\" (Pair \"48.7605108,2.064785,17\" (Pair 1 (Pair { 1 } (Pair 0 (Pair { } { Elt 1 2000 })))))))" --force

evse_cool=`$cli show address $evse_cool_alias`
evse_plug=`$cli show address $evse_plug_alias`
evse_wine=`$cli show address $evse_wine_alias`
evse_gena=`$cli show address $evse_gena_alias`

# Add whitelisting for adressbook
$cli call $addressbook_alias --entry add_whitelist --with $user_cool --force
$cli call $addressbook_alias --entry add_whitelist --with $user_wine --force

# Add evse in adressbook
$cli call $addressbook_alias --entry addupdate_evse --as $user_cool --with "(\"WNCooL\", $evse_cool, $admin, \"https://evsemanager.werenode.com\", 5000, $user_cool)" --force
$cli call $addressbook_alias --entry addupdate_evse --as $user_cool --with "(\"WNPLUG\", $evse_plug, $admin, \"https://evsemanager.werenode.com\", 5000, $user_cool)" --force
$cli call $addressbook_alias --entry addupdate_evse --as $user_wine --with "(\"WNWine\", $evse_wine, $admin, \"https://evsemanager.werenode.com\", 5000, $user_wine)" --force
$cli call $addressbook_alias --entry addupdate_evse --as $user_cool --with "(\"WNGENA\", $evse_gena, $admin, \"https://evsemanager.werenode.com\", 5000, $user_cool)" --force

# Add services
$cli call $evse_gena_alias --entry addservice --with "(522, 2139)" --force

# Transfer WRC to users (maybe useless)
$cli call $token_alias --entry transfer --with "($admin, $user_cool, 100_000)" --force
$cli call $token_alias --entry transfer --with "($admin, $user_wine, 100_000)" --force
