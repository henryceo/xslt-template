<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" version="1.0">
	<xsl:template name="taxType">
		<xsl:param name="taxCode"/>
		<xsl:variable name="taxs">
			<TaxCode>
				<tax>
					<id>EX</id>
					<value>4</value>
				</tax>
				<tax>
					<id>ITBIS</id>
					<value>1</value>
				</tax>
			</TaxCode>
		</xsl:variable>
		<xsl:value-of select="msxsl:node-set($taxs)/TaxCode/tax[id=$taxCode]/value"/>
	</xsl:template>
</xsl:stylesheet>
