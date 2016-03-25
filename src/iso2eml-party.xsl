<?xml version="1.0" encoding="UTF-8"?> <xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:eml="eml://ecoinformatics.org/eml-2.1.1" 
    xmlns:stmml="http://www.xml-cml.org/schema/stmml" 
    xmlns:sw="eml://ecoinformatics.org/software-2.1.1" 
    xmlns:cit="eml://ecoinformatics.org/literature-2.1.1" 
    xmlns:ds="eml://ecoinformatics.org/dataset-2.1.1" 
    xmlns:prot="eml://ecoinformatics.org/protocol-2.1.1" 
    xmlns:doc="eml://ecoinformatics.org/documentation-2.1.1" 
    xmlns:res="eml://ecoinformatics.org/resource-2.1.1" 
    xmlns:gmd="http://www.isotc211.org/2005/gmd" 
    xmlns:gco="http://www.isotc211.org/2005/gco"
    xmlns:gml="http://www.opengis.net/gml/3.2"
    xmlns:gmx="http://www.isotc211.org/2005/gmx"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" >

<xsl:output method="xml" encoding="UTF-8" indent="yes" />
<xsl:strip-space elements="*" />

<!-- Handle eml-party fields -->    
<xsl:template name="party">
    <xsl:param name = "party" />
    <xsl:apply-templates />   
    <phone><xsl:value-of select="normalize-space(//gmd:voice/gco:CharacterString)"/></phone>
    <electronicMailAddress><xsl:value-of select="normalize-space(//gmd:CI_Address/gmd:electronicMailAddress/gco:CharacterString)"/></electronicMailAddress>
</xsl:template>

<!-- Add an individualName -->
<xsl:template match="gmd:individualName">
    <individualName>
        <surName><xsl:value-of select="normalize-space(gco:CharacterString)"/></surName>
    </individualName>
</xsl:template>

<!-- Add an organizationName -->
<xsl:template match="gmd:organisationName">
    <organizationName><xsl:value-of select="normalize-space(gco:CharacterString)"/></organizationName>
</xsl:template>

<!-- Add a positionName -->
<xsl:template match="gmd:positionName">
    <positionName><xsl:value-of select="normalize-space(gco:CharacterString)"/></positionName>
</xsl:template>

<!-- voice, email, and role are all noops so they can be reordered correctly -->
<xsl:template match="gmd:voice" />
<xsl:template match="gmd:electronicMailAddress" />
<xsl:template match="gmd:role" />

<xsl:template match="gmd:CI_Address"> 
    <address>
        <deliveryPoint><xsl:value-of select="normalize-space(gmd:deliveryPoint/gco:CharacterString)"/></deliveryPoint>
        <city><xsl:value-of select="normalize-space(gmd:city/gco:CharacterString)"/></city>
        <administrativeArea><xsl:value-of select="normalize-space(gmd:administrativeArea/gco:CharacterString)"/></administrativeArea>
        <postalCode><xsl:value-of select="normalize-space(gmd:postalCode/gco:CharacterString)"/></postalCode>
        <country><xsl:value-of select="normalize-space(gmd:country/gco:CharacterString)"/></country>
    </address>
</xsl:template>

</xsl:stylesheet>