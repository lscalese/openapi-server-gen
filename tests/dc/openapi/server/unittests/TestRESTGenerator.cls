Class dc.openapi.server.unittests.TestRESTGenerator Extends %UnitTest.TestCase
{

Method OnBeforeAllTests() As %Status
{
	Do $SYSTEM.OBJ.DeletePackage("unitestpetstore")
	Quit $$$OK
}

Method OnAfterAllTests() As %Status
{
	Do $SYSTEM.OBJ.DeletePackage("unitestpetstore")
	
	Set ns = $NameSpace
	New $NameSpace
	Set $NameSpace = "%SYS"

	Do ##class(Security.Applications).Delete("/petstore/unittests")
	
	Set $NameSpace = ns

	
	Quit $$$OK
}

Method Test01GeneratePetStore()
{
	Set features("compile") = 0
 	Set sc = ##class(dc.openapi.server.ServerAppGenerator).Generate("unitestpetstore", "https://petstore3.swagger.io/api/v3/openapi.json", "/petstore/unittests", .features)
	Do $$$AssertStatusOK(sc, "Generate class for Petstore")
	Quit
}

Method Test03WebApp()
{
	Set ns = $NameSpace
	New $NameSpace
	Set $NameSpace = "%SYS"

	Set exists = ##class(Security.Applications).Exists("/petstore/unittests")
	Set $NameSpace = ns
	Do $$$AssertTrue(exists, "Web Application exists.")

	Quit
}

Method Test02CompilePetStore()
{
	Set features("compile") = 0
 	Set sc = $SYSTEM.OBJ.CompilePackage("unitestpetstore")
	Do $$$AssertStatusOK(sc, "Generate class for Petstore")
	Quit
}

}
