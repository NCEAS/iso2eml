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
	<xsl:template name="coverage" match="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:extent">
		<!-- Add EML geographic and temporal coverages, if available -->
		<coverage>
			<!-- Add geographic coverages -->
			<xsl:apply-templates select=".//gmd:EX_Extent/gmd:geographicElement" />
			
			<!-- Add temporal coverages -->
			<xsl:apply-templates select=".//gmd:EX_Extent/gmd:temporalElement" />
			
		</coverage>
	</xsl:template>
	
	<!-- Handle geographic coverage elements -->
	<xsl:template name="geographicCoverage" match="gmd:EX_Extent/gmd:geographicElement">
		<xsl:comment>Geographic coverage</xsl:comment>
		
		<!-- Handle geographic description -->
		<geographicCoverage>
			<geographicDescription>
				<xsl:value-of select=".//gmd:geographicIdentifier/gmd:MD_Identifier/gmd:code/gco:CharacterString" />
			</geographicDescription>
			<xsl:apply-templates select=".//gmd:EX_GeographicBoundingBox" />
		</geographicCoverage>
	</xsl:template>
	
	<!-- Handle geographic bounding boxes -->
	<xsl:template name="boundingCoordinates" match="gmd:EX_GeographicBoundingBox">
		
		<!-- Add bounding coordinates -->
		<boundingCoordinates>
			<westBoundingCoordinate>
				<xsl:value-of select="normalize-space(gmd:westBoundLongitude/gco:Decimal)" />
			</westBoundingCoordinate>
			<eastBoundingCoordinate>
				<xsl:value-of select="normalize-space(gmd:eastBoundLongitude/gco:Decimal)" />
			</eastBoundingCoordinate>
			<northBoundingCoordinate>
				<xsl:value-of select="normalize-space(gmd:northBoundLatitude/gco:Decimal)" />
			</northBoundingCoordinate>
			<southBoundingCoordinate>
				<xsl:value-of select="normalize-space(gmd:southBoundLatitude/gco:Decimal)" />
			</southBoundingCoordinate>
		</boundingCoordinates>
	</xsl:template>
	
	<!-- Handle temporal coverage elements -->
	<xsl:template name="temporalCoverage" match="gmd:EX_Extent/gmd:temporalElement">
		<xsl:comment>Temporal coverage</xsl:comment>
		<temporalCoverage>
			<rangeOfDates>
				<beginDate>
					<calendarDate>
						<xsl:value-of select="gmd:EX_TemporalExtent/gmd:extent/gml:TimePeriod/gml:beginPosition" />
					</calendarDate>
				</beginDate>
				<endDate>
					<calendarDate>
						<xsl:value-of select="gmd:EX_TemporalExtent/gmd:extent/gml:TimePeriod/gml:endPosition" />
					</calendarDate>
				</endDate>
			</rangeOfDates>
		</temporalCoverage>
	</xsl:template>

</xsl:stylesheet>
