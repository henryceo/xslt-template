<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/" name="templateOtraMoneda">
        
        <xsl:variable name="document" select="/root/Document"/>
        <xsl:variable name="documentLines" select="$document/DocumentLines/DocumentLine"/>
        
        <xsl:variable name="docCurrency" select="$document/DocCurrency"/>
	    <xsl:variable name="tipoMoneda" select="/root/MappingTables/Currencies/Currency[./Code = $docCurrency]/Value"/>
        
        <TipoMoneda><xsl:value-of select="$tipoMoneda"/></TipoMoneda>
        <TipoCambio><xsl:value-of select="$document/DocRate"/></TipoCambio>
        <MontoGravadoTotalOtraMoneda><xsl:value-of select="sum($documentLines[TaxLiable='tYES']/RowTotalFC)"/></MontoGravadoTotalOtraMoneda>
        <MontoGravado1OtraMoneda><xsl:value-of select="sum($documentLines[TaxLiable='tYES']/RowTotalFC)"/></MontoGravado1OtraMoneda>
        <MontoExentoOtraMoneda><xsl:value-of select="sum($documentLines[TaxLiable='tNO']/RowTotalFC)"/></MontoExentoOtraMoneda>
        <TotalITBISOtraMoneda><xsl:value-of select="$document/VatSumFc"/></TotalITBISOtraMoneda>
        <TotalITBIS1OtraMoneda><xsl:value-of select="$document/VatSumFc"/></TotalITBIS1OtraMoneda>
        <MontoTotalOtraMoneda><xsl:value-of select="$document/DocTotalFc"/></MontoTotalOtraMoneda>
        
    </xsl:template>
</xsl:stylesheet>
