<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/" name="templateTotales">
        <xsl:variable name="document" select="/root/Document"/>
        
        <xsl:variable name="documentLines" select="$document/DocumentLines"/>
        <xsl:variable name="docTotal" select="$document/DocTotal"/>
        <xsl:variable name="vatSum" select="$document/VatSum"/>
        <xsl:variable name="taxCodes" select="/root/MappingTables/TaxCodes"/>
        
        <MontoGravadoTotal><xsl:value-of select="sum($documentLines/DocumentLine[TaxTotal>0]/LineTotal)"/></MontoGravadoTotal>
        
        <xsl:for-each select="$taxCodes/TaxCode">
            <xsl:sort select="Value"/>
            <xsl:variable name="code"><xsl:value-of select="./Code"/></xsl:variable>
            
            <xsl:if test="./Value = 1 and count($documentLines/DocumentLine[TaxCode=$code]) > 0">
                <MontoGravadoI1><xsl:value-of select="sum($documentLines/DocumentLine[TaxCode=$code]/LineTotal)"/></MontoGravadoI1>
            </xsl:if>
            <xsl:if test="./Value = 2 and count($documentLines/DocumentLine[TaxCode=$code]) > 0">
                <MontoGravadoI2><xsl:value-of select="sum($documentLines/DocumentLine[TaxCode=$code]/LineTotal)"/></MontoGravadoI2>
            </xsl:if>
            <xsl:if test="./Value = 4 and count($documentLines/DocumentLine[TaxCode=$code]) > 0">
                <MontoExento><xsl:value-of select="sum($documentLines/DocumentLine[TaxCode=$code]/LineTotal)"/></MontoExento>
            </xsl:if>
        </xsl:for-each>
        
        <xsl:for-each select="$taxCodes/TaxCode">
            <xsl:sort select="Value"/>
            <xsl:variable name="code"><xsl:value-of select="./Code"/></xsl:variable>
            <xsl:if test="./Value = 1 and count($documentLines/DocumentLine[TaxCode=$code]) > 0">
                <ITBIS1><xsl:value-of select="./TaxRate"/></ITBIS1>
            </xsl:if>
            <xsl:if test="./Value = 2 and count($documentLines/DocumentLine[TaxCode=$code]) > 0">
                <ITBIS2><xsl:value-of select="./TaxRate"/></ITBIS2>
            </xsl:if>
        </xsl:for-each>
        
        <TotalITBIS><xsl:value-of select="$vatSum"/></TotalITBIS>
        
        <xsl:for-each select="$taxCodes/TaxCode">
            <xsl:sort select="Value"/>
            <xsl:variable name="code"><xsl:value-of select="./Code"/></xsl:variable>
            <xsl:if test="./Value = 1 and count($documentLines/DocumentLine[TaxCode=$code]) > 0">
                <TotalITBIS1><xsl:value-of select="$documentLines/DocumentLine[TaxCode=$code]/TaxTotal"/></TotalITBIS1>
            </xsl:if>
            <xsl:if test="./Value = 2 and count($documentLines/DocumentLine[TaxCode=$code]) > 0">
                <TotalITBIS2><xsl:value-of select="$documentLines/DocumentLine[TaxCode=$code]/TaxTotal"/></TotalITBIS2>
            </xsl:if>
        </xsl:for-each>
        <MontoTotal><xsl:value-of select="$docTotal"/></MontoTotal>
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
