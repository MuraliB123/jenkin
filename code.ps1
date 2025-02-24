function Generate-Changelog {
    param (
        [string]$outputFilePath,
        [string]$sqlPath
    )

    $xmlsettings = New-Object System.Xml.XmlWriterSettings
    $xmlsettings.Indent = $true
    $xmlWriter = [System.XML.XmlWriter]::Create($outputFilePath, $xmlsettings)

    # Root element
    $xmlWriter.WriteStartElement("databaseChangeLog", "http://www.liquibase.org/xml/ns/dbchangelog")
    $xmlWriter.WriteAttributeString("xmlns", "xsi", $null, "http://www.w3.org/2001/XMLSchema-instance")
    $xmlWriter.WriteAttributeString("xmlns", "pro", $null, "http://www.liquibase.org/xml/ns/pro")
    $xmlWriter.WriteAttributeString("xsi", "schemaLocation", "http://www.w3.org/2001/XMLSchema-instance", "http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-latest.xsd http://www.liquibase.org/xml/ns/pro http://www.liquibase.org/xml/ns/pro/liquibase-pro-latest.xsd")

   
    $sqlFiles = Get-ChildItem -Path $sqlPath -Filter "*.sql"
    $relativePath = Split-Path -Leaf $sqlPath
     

    foreach ($file in $sqlFiles) {
        $fileNameParts = $file.BaseName -split "_"
        $id = $fileNameParts[0]
        $author = $fileNameParts[-1]

        $xmlWriter.WriteStartElement("changeSet")
        $xmlWriter.WriteAttributeString("id", "$id")
        $xmlWriter.WriteAttributeString("author", "$author")
        $xmlWriter.WriteAttributeString("context", "dev")

        $xmlWriter.WriteStartElement("sqlFile")
        $xmlWriter.WriteAttributeString("path", "$relativePath/" + $file.Name)
        $xmlWriter.WriteAttributeString("relativeToChangelogFile", "true")
        $xmlWriter.WriteEndElement()

        $xmlWriter.WriteEndElement() 
        
    }

    $xmlWriter.WriteEndElement() 
    $xmlWriter.Flush()
    $xmlWriter.Close()

    Write-Output "Changelog generated successfully at $outputFilePath"
}

Generate-Changelog -outputFilePath "C:\Users\MuraliB\Documents\examples\xml\changelog.xml" -sqlPath "C:\Users\MuraliB\Documents\examples\xml\sqls"
