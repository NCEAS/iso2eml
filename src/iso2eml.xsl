<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
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
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>

	<xsl:template match="/gmd:MD_Metadata">
		<eml:eml>
            <xsl:attribute name="xsi:schemaLocation">eml://ecoinformatics.org/eml-2.1.1 ~/development/eml/eml.xsd</xsl:attribute>
			<xsl:attribute name="packageId">
                <xsl:value-of select="gmd:fileIdentifier/gco:CharacterString"/>
			</xsl:attribute>
			<xsl:attribute name="system">
				<xsl:value-of select="'knb'"/>
			</xsl:attribute>
			<xsl:attribute name="scope">
				<xsl:value-of select="'system'"/>
			</xsl:attribute>
			<dataset>
                <xsl:for-each select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:title/gco:CharacterString">
					<title>
						<xsl:value-of select="."/>
					</title>
				</xsl:for-each>
				<creator>		               
							<individualName>
								<surName>Jones
                                </surName>
                            </individualName>
				</creator>
				<pubDate>
				</pubDate>	       
				<abstract>
					<para>
						<literalLayout>Abstract here
						</literalLayout>
					</para>
				</abstract>
				
				<keywordSet>	
				</keywordSet>
				<intellectualRights>Rights
				</intellectualRights>
				<purpose>
					<para>
					</para>
				</purpose>
				<contact>
							<individualName>
								<surName>Jones
								</surName>
							</individualName>						
							<organizationName>NCEAS
							</organizationName>
				</contact>
			</dataset>
		</eml:eml>
	</xsl:template>
	
</xsl:stylesheet>
