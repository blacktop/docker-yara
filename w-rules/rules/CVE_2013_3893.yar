rule CVE_2013_3893
{
    meta:
        author = "Brian Bartholomew iSIGHT Partners"
        maltype = "apt"
        yaraexchange = "No distribution without author's consent"
        date = "09/20/2013"
        descrption = "This rule will detect CVE-2013-3893"
        reference_1 = "http://technet.microsoft.com/en-us/security/advisory/2887505"
        reference_2 = "http://blogs.technet.com/b/srd/archive/2013/09/17/cve-2013-3893-fix-it-workaround-available.aspx"
        status = "Tested against the one known live sample we were able to find and it works"

    strings:
        $String_1 = "onlosecapture" nocase
        $String_2 = "setCapture" nocase
        $String_3 = "CollectGarbage" nocase

    condition:
        all of them
}