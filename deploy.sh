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
# token_v2:    KT1LqEyTQxD2Dsdkk4LME5YGcBqazAwXrg4t
# evse WNCooL: KT1SGoBNn5kLbLSi35xWrJWPrzSwVAMcWy1P
# evse WNPLUG: KT1JWTj5RJQTm9c9HtHWgZKmdXPisT3DCxMw
# evse WNWine: KT19b6BCikGACdN4uqffgSrwyJ19S2ySjveo
# evse WNGENA: KT1KEEGSnag8aTDY9BRb5GJc9m33FbpPWeW5
# evse WNTEST: KT1CfWHWB6JydPP9kaT3C7d3Xc76UHNsV2T2
# evse WNRoNA: KT1Kfv4R7wQ6KnyJVRYNXZMDSvsVtGPpYbsL
#
# granada
# addressbook: KT1DEn48K6Fccw8so5MPhrFXU6hx4VSaF3zi
# evseledger:  KT1KrszyxQEFfwbPYUAg1Crv3vYzQahuH32y
# token:       KT1NXgfcCEvoFGQSY6xgWV4XStoccwzryTxP
# evse WNCooL: KT1XhYQEPtVehchB3DmGCZc2RnaFtaLeT3BX
# evse WNPLUG: KT1B7PZkmjB4jSPCTnfPAqELuG1oyfTmpYvv
# evse WNWine: KT1H6YpS8dWWeEF1p6mjRLtfCKN8dodWkgCY
# evse WNTEST: KT1F97fb7MgH7dvw5KpMQQQz1XpZ4ABpUSz3
# evse WNGENA: KT1McDgKY9j2vKtBgsCmGAmTaMpLsZff367P
# evse WNRONA: KT1PcaAXM2iFsJFJ7ws71fCqphKqh249wfE8
###

cli=completium-cli

admin_alias=werenode_admin
user_cool_alias=user_cool
user_wine_alias=user_wine

#addressbook_alias=werenode_addressbook
#evseledger_alias=werenode_evseledger
token_alias=werenode_token
#evse_cool_alias=werenode_evse_cool
#evse_plug_alias=werenode_evse_plug
#evse_wine_alias=werenode_evse_wine
#evse_gena_alias=werenode_evse_gena
#evse_test_alias=werenode_evse_test
#evse_rona_alias=werenode_evse_rona

addressbook_alias=test_werenode_addressbook
evseledger_alias=test_werenode_evseledger
#token_alias=test_werenode_token
evse_cool_alias=test_werenode_evse_cool
evse_plug_alias=test_werenode_evse_plug
evse_wine_alias=test_werenode_evse_wine
evse_gena_alias=test_werenode_evse_gena
evse_test_alias=test_werenode_evse_test
evse_rona_alias=test_werenode_evse_rona

admin=`$cli show address $admin_alias`
user_cool=`$cli show address $user_cool_alias`
user_wine=`$cli show address $user_wine_alias`

#$cli set endpoint https://granadanet.smartpy.io
$cli set endpoint https://mainnet.smartpy.io
$cli set account $admin_alias

# Originate contracts
#$cli originate ./michelson/addressbook.tz --named $addressbook_alias --init "(Pair \"$admin\" (Pair \"$admin\" (Pair {  } (Pair {  } (Pair {  } (Pair {  } { Elt \"\" 0x68747470733a2f2f776572656e6f64652e636f6d2f636f6e7472616374732f61646472657373626f6f6b2e6a736f6e }))))))" --force
$cli originate ./michelson/token_v2.tz    --named $token_alias --init "(Pair 1000000 (Pair { } (Pair { Elt \"$admin\" 89500000000000000 } { Elt \"\" 0x697066733a2f2f516d58544a6e51734842444e4b444655484238454a424b7a6159386d47556b415047723534783266383644725033 })))" --force
#$cli originate ./michelson/evseledger.tz  --named $evseledger_alias --init "(Pair \"$admin\" (Pair None (Pair 0 (Pair { } (Pair { } { Elt \"\" 0x68747470733a2f2f776572656e6f64652e636f6d2f636f6e7472616374732f61646472657373626f6f6b2e6a736f6e })))))" --force

# Originate evse contracts
#$cli originate ./michelson/evse.tz        --named $evse_cool_alias --init "(Pair \"$admin\" (Pair \"$admin\" (Pair \"48.775379177873134,2.044936695048847\" (Pair 1 (Pair { 1 } (Pair 0 (Pair { } { Elt 1 2000 })))))))" --force
#$cli originate ./michelson/evse.tz        --named $evse_plug_alias --init "(Pair \"$admin\" (Pair \"$admin\" (Pair \"48.8701025,2.2909664\" (Pair 1 (Pair { 1 } (Pair 0 (Pair { } { Elt 1 2000 })))))))" --force
#$cli originate ./michelson/evse.tz        --named $evse_wine_alias --init "(Pair \"$admin\" (Pair \"$admin\" (Pair \"49.1885924,-0.3609428\" (Pair 1 (Pair { 1 } (Pair 0 (Pair { } { Elt 1 2000 })))))))" --force
#$cli originate ./michelson/evse_v2.tz     --named $evse_test_alias --init "(Pair \"$admin\" (Pair \"$admin\" (Pair \"0,0\" (Pair 978 (Pair { 1 } (Pair 0 (Pair { } { Elt 522 2139 })))))))" --force
#$cli originate ./michelson/evse_v2.tz     --named $evse_gena_alias --init "(Pair \"$admin\" (Pair \"$admin\" (Pair \"48.76002986544397,2.0647528134929143\" (Pair 978 (Pair { 1 } (Pair 0 (Pair { } { Elt 522 2139 })))))))" --force
#$cli originate ./michelson/evse_v2.tz     --named $evse_rona_alias --init "(Pair \"$admin\" (Pair \"$admin\" (Pair \"0,0\" (Pair 978 (Pair { 1 } (Pair 0 (Pair { } { Elt 22 214 })))))))" --force

#evse_cool=`$cli show address $evse_cool_alias`
#evse_plug=`$cli show address $evse_plug_alias`
#evse_wine=`$cli show address $evse_wine_alias`
#evse_test=`$cli show address $evse_test_alias`
#evse_gena=`$cli show address $evse_gena_alias`
#evse_rona=`$cli show address $evse_rona_alias`

# Add whitelisting for adressbook
#$cli call $addressbook_alias --entry add_whitelist --with $user_cool --force
#$cli call $addressbook_alias --entry add_whitelist --with $user_wine --force

# Add evse in adressbook
#$cli call $addressbook_alias --entry addupdate_evse --as $user_cool --with "(\"WNCooL\", $evse_cool, $admin, \"https://evsemanager.werenode.com\", 5000, $user_cool)" --force
#$cli call $addressbook_alias --entry addupdate_evse --as $user_cool --with "(\"WNPLUG\", $evse_plug, $admin, \"https://evsemanager.werenode.com\", 5000, $user_cool)" --force
#$cli call $addressbook_alias --entry addupdate_evse --as $user_wine --with "(\"WNWine\", $evse_wine, $admin, \"https://evsemanager.werenode.com\", 5000, $user_wine)" --force
#$cli call $addressbook_alias --entry addupdate_evse --as $user_cool --with "(\"WNTEST\", $evse_test, $admin, \"https://evsemanager.werenode.com\", 5000, $user_cool)" --force
#$cli call $addressbook_alias --entry addupdate_evse --as $user_cool --with "(\"WNGENA\", $evse_gena, $admin, \"https://evsemanager.werenode.com\", 5000, $user_cool)" --force
#$cli call $addressbook_alias --entry addupdate_evse --as $user_cool --with "(\"WNRoNA\", $evse_rona, $admin, \"https://evsemanager.werenode.com\", 5000, $user_cool)" --force

# Transfer WRC to users (maybe useless)
#$cli call $token_alias --entry transfer --with "($admin, $user_cool, 100_000)" --force
#$cli call $token_alias --entry transfer --with "($admin, $user_wine, 100_000)" --force

#$cli originate ./michelson/evse_v2.tz      --named $evse_test_alias --init "(Pair \"$admin\" (Pair \"$admin\" (Pair \"0,0\" (Pair 978 (Pair { 1 } (Pair 0 (Pair { } { Elt 522 2139 })))))))" --force
#$cli call $addressbook_alias --entry addupdate_evse --as $user_cool --with "(\"WNTEST\", $evse_gena, $admin, \"https://evsemanager.werenode.com\", 5000, $user_cool)" --force
