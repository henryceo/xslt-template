<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" version="1.0">
	<xsl:template name="templateTipoIngreso">
		<xsl:param name="paramCode"/>
            <xsl:variable name="codes">
                <codes>
                    <code>
                        <id>oInvoices</id>
                        <value>01</value>
                    </code>
                </codes>
            </xsl:variable>
		<xsl:value-of select="msxsl:node-set($codes)/codes/code[id=$paramCode]/value"/>
	</xsl:template>
</xsl:stylesheet>