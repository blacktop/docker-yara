rule FE_RANSOMWARE_WANNACRY {
            meta:version=".4"
            filetype="PE"
            author="Ian.Ahl@fireeye.com @TekDefense"
            date="2017-05-12"
            description="Generic detection for most WannaCry variants"
strings:
            // Bitcoin URLs
            $bcURL1 = "http://www.btcfrog.com/qr/bitcoinPNG.php?address=%" ascii wide nocase
            $bcURL2 = "https://www.google.com/search?q=how+to+buy+bitcoin" ascii wide nocase

            // Ransom Message
            $msg1 = "Congratulations! Succeed to check your payment!" ascii wide
            $msg2 = "Start decrypting now!" ascii wide
            $msg3 = "All your files have been decrypted!" ascii wide
            $msg4 = "Pay now, if you want to decrypt ALL your files!" ascii wide
            $msg5 = "Send $%d worth of bitcoin to this address:" ascii wide
            $msg6 = "Ooops, your files have been encrypted!" ascii wide

            // WANNA Strings
            $wanna1 = "Wanna Decryptor 1.0" ascii wide
            $wanna2 = "Wana Decrypt0r" ascii wide
            $wanna3 = "Wana Decryptor" ascii wide
            $wanna4 = "WANNACRY" ascii wide nocase
            $wanna5 = "WanaCrypt0r" ascii wide nocase
            $wanna6 = "WANACRY!" ascii wide
            $wanna7 = "WNcry@2ol7" ascii wide
            $wanna8 = "wcry@123"
            $wanna9 = "wcry@2016"

            // File references
            $fileA1 = "!WannaCryptor!.bmp" ascii wide
            $fileA2 = "!WannaDecryptor!.exe.lnk" ascii wide
            $fileA3 = "!Please Read Me!.txt" ascii wide

            $fileB1 = "@WanaDecryptor@.bmp" ascii wide
            $fileB2 = "@WanaDecryptor@.exe.lnk" ascii wide
            $fileB3 = "@Please_Read_Me@.txt" ascii wide

            // CMDS
            $cmd1 = "cmd.exe /c start /b vssadmin.exe Delete Shadows /All /Quiet" ascii wide nocase
            $cmd2 = "wmic shadowcopy delete" ascii wide
            $cmd3 = "bcdedit /set {default} bootstatuspolicy ignoreallfailures" ascii wide
            $cmd4 = "bcdedit /set {default} recoveryenabled no" ascii wide
            $cmd5 = "wbadmin delete catalog -quiet" ascii wide
            $cmd6 = "icacls . /grant Everyone:F /T /C /Q" ascii wide

            // MISC
            $misc1 = "StartTask" wide ascii
            $misc2 = "b.wry" wide ascii
            $misc3 = "c.wry" wide ascii
            $misc4 = "m.wry" wide ascii
            $misc5 = "inflate 1.1.3 Copyright 1995-1998 Mark Adler" wide ascii
            $misc6 = "?AVtype_info@@" wide ascii

condition:
            (
                        (
                                    (uint16(0) == 0x5A4D)
                        )
                        and
                        (
                                    all of ($fileA*)
                                    or
                                    all of ($fileB*)
                                    or
                                    (4 of ($msg*) and 2 of ($bcURL*))
                                    or
                                    2 of ($wanna*)
                                    or
                                    (2 of ($msg*) and 1 of ($cmd*))
                                    or
                                    4 of ($cmd*)
                                    or
                                    (1 of ($wanna*) and 1 of ($cmd*))
                                    or
                                    (1 of ($wanna*) and 3 of ($misc*))
                        )
            )
}

rule FE_RANSOMWARE_WANNACRY_EB {
           meta:version=".1"
           filetype="PE"
           author="Ian.Ahl@fireeye.com @TekDefense"
           date="2017-05-12"
           description="Focusing on the WannaCry variants with worm capabilities"
strings:

            // EB related strings in WANNACRY
            $eb1 = "__USERID__PLACEHOLDER__@" ascii wide
            $eb2 = "__TREEID__PLACEHOLDER__" ascii wide
            $eb3 = "LANMAN1.0" ascii wide
            $eb4 = "LANMAN2.1" ascii wide
            $eb5 = "\\PIPE\\" ascii wide
            $eb6 = "\\\\%s\\IPC$" ascii wide
            $eb7 = "__TREEPATH_REPLACE__" ascii wide
            $eb8 = "/K__USERID__PLACEHOLDER__" ascii wide

condition:
            (
                        (
                                    (uint16(0) == 0x5A4D)
                        )
                        and
                        (
                                    all of ($eb*)
                        )
            )
}
