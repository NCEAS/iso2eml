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

<xsl:import href="iso2eml-party.xsl"/>
<xsl:import href="iso2eml-coverage.xsl"/>

<xsl:output method="xml" encoding="UTF-8" indent="yes" />
<xsl:strip-space elements="*" />

<xsl:template match="/gmd:MD_Metadata">
<eml:eml>
    <xsl:attribute name="xsi:schemaLocation">eml://ecoinformatics.org/eml-2.1.1 ~/development/eml/eml.xsd</xsl:attribute>
    <!-- Add the packageId -->
	<xsl:attribute name="packageId"><xsl:value-of select="normalize-space(gmd:fileIdentifier/gco:CharacterString)"/></xsl:attribute>
    <xsl:attribute name="system"><xsl:value-of select="'knb'"/></xsl:attribute>
    <xsl:attribute name="scope"><xsl:value-of select="'system'"/></xsl:attribute>
    <dataset>
        <!-- Add the title -->
		<xsl:for-each select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:title/gco:CharacterString">
            <title><xsl:value-of select="normalize-space(.)"/></title>
        </xsl:for-each>
        
		<!-- Add creators -->
		<xsl:call-template name="creators">
			<xsl:with-param name="doc" select="." />
		</xsl:call-template>

        <!-- Add additional parties -->
		<xsl:call-template name="additional-parties">
			<xsl:with-param name="doc" select="." />
		</xsl:call-template>

		<!-- Add the pubDate if available -->
		<xsl:choose>
			<xsl:when test="./gmd:dateStamp != ''">
				<pubDate><xsl:value-of select="normalize-space(gmd:dateStamp)" /></pubDate>           
			</xsl:when>
		</xsl:choose>
		
		<!-- Add the abstract -->
        <abstract>
            <para><xsl:value-of select="normalize-space(gmd:identificationInfo/gmd:MD_DataIdentification/gmd:abstract/gco:CharacterString)" /></para>
        </abstract>
        
		<!-- Add keywords -->
		<keywordSet>    
        </keywordSet>

		<!-- Add intellectual rights -->
        <intellectualRights>Rights</intellectualRights>

		<!-- Add distribution -->

		<!-- Add coverage -->
		<xsl:call-template name="coverage" />
			
		<!-- Add contacts -->
		<xsl:call-template name="contacts">
			<xsl:with-param name="doc" select="." />
		</xsl:call-template>

		
		<!-- Add the publisher -->
		<xsl:call-template name="publishers">
			<xsl:with-param name="doc" select="." />
		</xsl:call-template>

		
		<!-- Add the pubPlace  -->
		
		<!-- Add the methods   -->
		
		<!-- Add the project   -->
		
		<!-- Add entities      -->
		
    </dataset>
</eml:eml>
</xsl:template>

</xsl:stylesheet>
