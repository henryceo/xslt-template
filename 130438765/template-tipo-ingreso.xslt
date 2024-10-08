<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template name="templateTipoIngreso">
		<xsl:param name="paramCode"/>
		
			<codes>
				<code>
					<id>oInvoices</id>
					<value>01</value>
				</code>
			</codes>
		
		<xsl:value-of select="codes/code[id=$paramCode]/value"/>
	</xsl:template>
</xsl:stylesheet>