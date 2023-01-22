Class dc.openapi.server.Samples
{

ClassMethod PetStore() As %Status
{
    Set applicationName = "petshopsrv"
    Write !,"Delete previous code generation ..."

    Do $SYSTEM.OBJ.DeletePackage(applicationName)

    Write !,"Generate client app "_applicationName _"..."

    Set sc = ##class(dc.openapi.server.ServerAppGenerator).Generate(applicationName, "https://petstore3.swagger.io/api/v3/openapi.json")

    Write "Status : ", $SYSTEM.Status.GetOneErrorText(sc)

    Return sc
}

ClassMethod GenServer() As %Status
{
    Set applicationName = "petshopsrv"

    Do $SYSTEM.OBJ.DeletePackage(applicationName _".model")
    Do $SYSTEM.OBJ.DeletePackage(applicationName _".requests")
    Do $SYSTEM.OBJ.DeletePackage(applicationName _".disp")
    
    
    Set spec = {}.%FromJSON(##class(%Dictionary.XDataDefinition).%OpenId(applicationName_".Spec||OpenAPI").Data)
    Set ServerGen = ##class(dc.openapi.server.RESTGenerator).%New(spec, applicationName)
    Set sc = ServerGen.Generate()

    If $$$ISERR(sc) Do $SYSTEM.Status.DisplayError(sc)

    Quit sc
}

}
