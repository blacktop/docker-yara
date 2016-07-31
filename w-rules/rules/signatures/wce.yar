rule wce : HackerTools
{
meta:
	author = "Josh Maine"
	date = "2013-06-12"
	description = "Windows Credential Editor"
	hash0 = "b5d8086fe3cf6fa96306b036674553da"
	hash2 = "0a061bf035bec3abcddfb2b406c5cb67"
	hash3 = "4fb08ad6583c2d44a098e325699789cb"
	hash4 = "30df6e7310edc6510c0844626ee51c1d"
	hash5 = "47738922e60d863046ee88af530e0347"
	hash6 = "df840ac27051d26555a109cc47d03fe4"
	hash7 = "bd73c74819d8db09c645c738bbd3f5b9"
	hash8 = "13181dcf9965c89cfafe0828b127966d"
	hash9 = "9012ed6c4dada6f495545299d0ce38b3"
	hash10 = "018cca70e20293d5d9bc45b0f76ca2d4"
	yaragenerator = "https://github.com/Xen0ph0n/YaraGenerator"
strings:
	$string0 = "Error in InjectDllAndCallFunction"
	$string1 = "WCEAddNTLMCredentials"
	$string2 = "Specify LUID instead of use current logon session."
	$string3 = "An error occurred changing the NTLM credentials."
	$string4 = "domain is too long"
	$string5 = "Cannot set event hook"
	$string6 = "- not enough space for environment" wide
	$string7 = "Friday"
	$string8 = "Refreshes every time a logon event occurs."
	$string9 = "domain: %s"
	$string10 = "- unexpected multithread lock error" wide
	$string11 = "username is too long"
	$string12 = "mscoree.dll" wide
	$string13 = "ERROR: CreateProcessWithLogonW"
	$string14 = "Security"
	$string15 = "- not enough space for arguments" wide
	$string16 = "WCEDelNTLMCredentials"
	$string17 = "- not enough space for locale information" wide
condition:
	17 of them
}
