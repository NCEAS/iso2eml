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

<xsl:output method="xml" encoding="UTF-8" indent="yes" />
<xsl:strip-space elements="*" />

<!-- Match any geographic or temporal coverage elements -->
<xsl:template match="gmd:extent">
	<!-- Add EML geographic and temporal coverages, if available -->
	<coverage>
		
		<!-- Add geographic coverages -->
		<xsl:call-template name="geographicCoverage">
            <xsl:with-param name="geographicCoverage" select = "." />
		</xsl:call-template>
		
		<!-- Add temporal coverages -->
		<xsl:call-template name="temporalCoverage">
            <xsl:with-param name="temporalCoverage" select = "." />
		</xsl:call-template>
		
	</coverage>
</xsl:template>

<!-- Handle geographic coverage elements -->
<xsl:template name="geographicCoverage">
	<xsl:comment>Geographic coverage</xsl:comment>
</xsl:template>

<!-- Handle temporal coverage elements -->
<xsl:template name="temporalCoverage">
	<xsl:comment>Temporal coverage</xsl:comment>
</xsl:template>

</xsl:stylesheet>
