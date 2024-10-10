<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" version="1.0">
	<xsl:template name="templateTotal">
		<xsl:param name="paramDocumentLines"/>
		<xsl:param name="taxField"/>
		<xsl:variable name="taxs">
			<TaxCode>
				<tax>
					<id>EX</id>
					<tasa>0</tasa>
					<tag>ITBIS3</tag>
				</tax>
				<tax>
					<id>ITBIS</id>
					<tasa>18</tasa>
					<tag>ITBIS1</tag>
				</tax>
			</TaxCode>
		</xsl:variable>
		<!-- <xsl:if test="$taxField = value">
							<xsl:value-of select="msxsl:node-set($taxs)/TaxCode/tax[id=$taxCode]/value"/>
							</xsl:if>
							<xsl:if test="$taxField = tasa">
							<xsl:value-of select="msxsl:node-set($taxs)/TaxCode/tax[id=$taxCode]/tasa"/>
							</xsl:if>
		
			<xsl:for-each select="$paramDocumentLines/DocumentLine">
		-->

		

		<xsl:for-each select="msxsl:node-set($taxs)/TaxCode">
			<xsl:element name="tag">
				<xsl:value-of select="tasa"/>
			</xsl:element>
		</xsl:for-each>
				
			
		
		<!--
							<MontoGravadoTotal>11987.04</MontoGravadoTotal>
							<MontoGravadoI1>11987.04</MontoGravadoI1>
							<MontoExento>27809.94</MontoExento>
							<ITBIS1>18</ITBIS1>
							<TotalITBIS>2157.67</TotalITBIS>
							<TotalITBIS1>2157.67</TotalITBIS1>
							<MontoTotal>41954.65</MontoTotal>
		-->
	</xsl:template>
</xsl:stylesheet>
