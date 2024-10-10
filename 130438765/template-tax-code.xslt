<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" version="1.0">
	<xsl:template name="taxType">
		<xsl:param name="taxCode"/>
		<xsl:param name="taxField"/>
		<xsl:variable name="taxs">
			<TaxCode>
				<tax>
					<id>EX</id>
					<value>4</value>
					<tasa>0</tasa>
				</tax>
				<tax>
					<id>ITBIS</id>
					<value>1</value>
					<tasa>18</tasa>
				</tax>
			</TaxCode>
		</xsl:variable>
		<xsl:value-of select="msxsl:node-set($taxs)/TaxCode/tax[id=$taxCode]/value"/>
		<!--<xsl:if test="$taxField = value">
			
		</xsl:if>
		<xsl:if test="$taxField = tasa">
			<xsl:value-of select="msxsl:node-set($taxs)/TaxCode/tax[id=$taxCode]/tasa"/>
		</xsl:if>-->
	</xsl:template>
</xsl:stylesheet>
