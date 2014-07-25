// Copyright (C) 2013-2014 Josh "blacktop" Maine
// This file is part of Malice - https://github.com/blacktop/malice
// See the file 'docs/LICENSE' for copying permission.


include "signatures/embedded.yar"
//include "signatures/shellcodes.yar"
include "signatures/vmdetect.yar"
// Anti analysis rulesets
include "signatures/avdetect.yar"
include "signatures/dbgdetect.yar"
include "signatures/sandboxdetect.yar"
include "signatures/vmdetect.yar"
include "signatures/capabilities.yar"
include "signatures/wce.yar"
// Packers
include "signatures/packer.yar"
include "signatures/epcompilersigs.yar"
include "signatures/eppackersigs.yar"
include "signatures/userdb_panda.yar"
include "signatures/UserDB.yar"
// Rats
include "signatures/rats.yar"
