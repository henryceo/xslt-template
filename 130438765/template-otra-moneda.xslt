<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" version="1.0">
<xsl:template name="templateOtraMoneda">
		<xsl:param name="paramDocumentLines"/>
		<xsl:param name="paramDocRate"/>
        <xsl:param name="paramDocCurrency"/>
        <xsl:param name="paramVatSumFc"/>
        <xsl:param name="paramDocTotalFc"/>

		<xsl:variable name="taxs">
			<TaxCode>
				<tax>
					<id>ITBIS</id>
					<tasa>18</tasa>
                    <value>1</value>
					<tag>
                        <id>ITBIS1</id>
                        <tag>MontoGravadoI1</tag>
                        <end>TotalITBIS1</end>
                    </tag>
				</tax>
				<tax>
					<id>ITBIS16</id>
                    <value>2</value>
					<tasa>16</tasa>
					<tag>
                        <id>ITBIS2</id>
                        <tag>MontoGravadoI2</tag>
                        <end>TotalITBIS2</end>
                    </tag>
				</tax>
				<tax>
					<id>EX</id>
					<tasa>0</tasa>
                    <value>4</value>
					<tag>
                        <id></id>
                        <tag>MontoExento</tag>
                    </tag>
				</tax>
			</TaxCode>
		</xsl:variable>

	    <TipoCambio><xsl:value-of select="$paramDocCurrency"/></TipoCambio>
	    <TipoMoneda><xsl:value-of select="$paramDocRate"/></TipoMoneda>
        <MontoGravadoTotalOtraMoneda><xsl:value-of select="sum($paramDocumentLines/DocumentLine[TaxLiable='tYES']/RowTotalFC)"/></MontoGravadoTotalOtraMoneda>
        <MontoGravado1OtraMoneda><xsl:value-of select="sum($paramDocumentLines/DocumentLine[TaxLiable='tYES']/RowTotalFC)"/></MontoGravado1OtraMoneda>
        <MontoExentoOtraMoneda><xsl:value-of select="sum($paramDocumentLines/DocumentLine[TaxLiable='tNO']/RowTotalFC)"/></MontoExentoOtraMoneda>
        <TotalITBISOtraMoneda><xsl:value-of select="$paramVatSumFc"/></TotalITBISOtraMoneda>
        <TotalITBIS1OtraMoneda><xsl:value-of select="$paramVatSumFc"/></TotalITBIS1OtraMoneda>
        <MontoTotalOtraMoneda><xsl:value-of select="$paramDocTotalFc"/></MontoTotalOtraMoneda>

       <!-- <xsl:for-each select="msxsl:node-set($taxs)/TaxCode/tax">
			<xsl:variable name="id"><xsl:value-of select="./id"/></xsl:variable>
            <xsl:if test="./value = 1 and count($paramDocumentLines/DocumentLine[TaxCode=$id]) > 0">
                <MontoGravadoI1><xsl:value-of select="sum($paramDocumentLines/DocumentLine[TaxCode=$id]/LineTotal)"/></MontoGravadoI1>
            </xsl:if>
            <xsl:if test="./value = 2 and count($paramDocumentLines/DocumentLine[TaxCode=$id]) > 0">
                <MontoGravadoI2><xsl:value-of select="sum($paramDocumentLines/DocumentLine[TaxCode=$id]/LineTotal)"/></MontoGravadoI2>
            </xsl:if>
            <xsl:if test="./value = 4 and count($paramDocumentLines/DocumentLine[TaxCode=$id]) > 0">
                <MontoExento><xsl:value-of select="sum($paramDocumentLines/DocumentLine[TaxCode=$id]/LineTotal)"/></MontoExento>
            </xsl:if>
		</xsl:for-each>
        <xsl:for-each select="msxsl:node-set($taxs)/TaxCode/tax">
			<xsl:variable name="id"><xsl:value-of select="./id"/></xsl:variable>
            <xsl:if test="./value = 1 and count($paramDocumentLines/DocumentLine[TaxCode=$id]) > 0">
                <ITBIS1><xsl:value-of select="./tasa"/></ITBIS1>
            </xsl:if>
            <xsl:if test="./value = 2 and count($paramDocumentLines/DocumentLine[TaxCode=$id]) > 0">
                <ITBIS2><xsl:value-of select="./tasa"/></ITBIS2>
            </xsl:if>
		</xsl:for-each>
        <xsl:for-each select="msxsl:node-set($taxs)/TaxCode/tax">
			<xsl:variable name="id"><xsl:value-of select="./id"/></xsl:variable>
            <xsl:if test="./value = 1 and count($paramDocumentLines/DocumentLine[TaxCode=$id]) > 0">
                <TotalITBIS1><xsl:value-of select="$paramDocumentLines/DocumentLine[TaxCode=$id]/TaxTotal"/></TotalITBIS1>
            </xsl:if>
            <xsl:if test="./value = 2 and count($paramDocumentLines/DocumentLine[TaxCode=$id]) > 0">
                <TotalITBIS2><xsl:value-of select="$paramDocumentLines/DocumentLine[TaxCode=$id]/TaxTotal"/></TotalITBIS2>
        </xsl:if>
		</xsl:for-each>-->

	</xsl:template>
</xsl:stylesheet>
