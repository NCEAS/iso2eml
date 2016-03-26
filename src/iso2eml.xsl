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
			<xsl:if test="gmd:dateStamp/gco:DateTime != ''">
				<pubDate><xsl:value-of select="normalize-space(gmd:dateStamp/gco:DateTime)" /></pubDate>           
			</xsl:if>
			
		<!-- Add the language -->
		<xsl:if test="gmd:language/gco:CharacterString != ''">
			<language><xsl:value-of select="normalize-space(gmd:language/gco:CharacterString)" /></language>           
		</xsl:if>
		
		<!-- Add the abstract -->
        <abstract>
            <para><xsl:value-of select="normalize-space(gmd:identificationInfo/gmd:MD_DataIdentification/gmd:abstract/gco:CharacterString)" /></para>
        </abstract>
        
		<!-- Add keywords -->
		<keywordSet>    
        </keywordSet>

		<!-- Add intellectual rights -->
		<!-- 
			Note these rules are specific to the arcticdata.io content, 
			and will need to be generalized
		-->
		<xsl:choose>
			<xsl:when test="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:resourceConstraints/gmd:MD_Constraints/gmd:useLimitation">
				<!-- Transfer MD_Constraints/useLimitation directly -->
		        <intellectualRights>
	                <para>
						<xsl:value-of select="normalize-space(gmd:identificationInfo/gmd:MD_DataIdentification/gmd:resourceConstraints/gmd:MD_Constraints/gmd:useLimitation/gco:CharacterString)" />
	                </para>
		        </intellectualRights>
			</xsl:when>
			<xsl:when test="contains(gmd:identificationInfo/gmd:MD_DataIdentification/gmd:resourceConstraints/gmd:MD_LegalConstraints/gmd:otherConstraints/gco:CharacterString,'Access Constraints: No Access Constraints. Use Constraints: No Use Constraints.')">
				<!-- Assign CC-0 for MD_LegalConstraints/otherConstraints -->
		        <intellectualRights>
	                <para>
		                <xsl:text>This work is dedicated to the public domain under the Creative Commons Universal 1.0 Public Domain Dedication. To view a copy of this dedication, visit https://creativecommons.org/publicdomain/zero/1.0/.</xsl:text>
	                </para>
		        </intellectualRights>
			</xsl:when>
			<xsl:otherwise>
				
				<!-- Assign a CC-BY license -->
		        <intellectualRights>
	                <para>
	                	<xsl:text>This work is licensed under the Creative Commons Attribution 4.0 International License.To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/.</xsl:text>
	                </para>
		        </intellectualRights>
				
			</xsl:otherwise>
		</xsl:choose>

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
