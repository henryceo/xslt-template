<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" version="1.0">
<xsl:template name="templateTotal">
		<xsl:param name="paramDocumentLines"/>
		<xsl:param name="paramDocTotal"/>
        <xsl:param name="paramVatSum"/>

		<xsl:param name="taxField"/>
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

		
		<MontoGravadoTotal><xsl:value-of select="sum($paramDocumentLines/DocumentLine[TaxTotal>0]/LineTotal)"/></MontoGravadoTotal>

        <xsl:for-each select="msxsl:node-set($taxs)/TaxCode/tax">
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
        <TotalITBIS><xsl:value-of select="$paramVatSum"/></TotalITBIS>
        <xsl:for-each select="msxsl:node-set($taxs)/TaxCode/tax">
			<xsl:variable name="id"><xsl:value-of select="./id"/></xsl:variable>
            <xsl:if test="./value = 1 and count($paramDocumentLines/DocumentLine[TaxCode=$id]) > 0">
                <TotalITBIS1><xsl:value-of select="$paramDocumentLines/DocumentLine[TaxCode=$id]/TaxTotal"/></TotalITBIS1>
            </xsl:if>
            <xsl:if test="./value = 2 and count($paramDocumentLines/DocumentLine[TaxCode=$id]) > 0">
                <TotalITBIS2><xsl:value-of select="$paramDocumentLines/DocumentLine[TaxCode=$id]/TaxTotal"/></TotalITBIS2>
        </xsl:if>
		</xsl:for-each>
	    <MontoTotal><xsl:value-of select="$paramDocTotal"/></MontoTotal>
		<!--<xsl:for-each select="msxsl:node-set($taxs)/TaxCode/tax">
			
            <xsl:variable name="id"><xsl:value-of select="./id"/></xsl:variable>
            <xsl:if test="count($paramDocumentLines/DocumentLine[TaxCode=$id]) > 0">
                
                <xsl:if test="./tag[1]/id != ''">
                    <xsl:element name="{./tag[1]/tag}">
				        <xsl:value-of select="sum($paramDocumentLines/DocumentLine[TaxCode=$id]/LineTotal)"/>
			        </xsl:element>
                    <xsl:element name="{./tag[1]/id}">
				        <xsl:value-of select="./tasa"/>
			        </xsl:element>
                  
                    <xsl:element name="{./tag[1]/end}">
				        <xsl:value-of select="sum($paramDocumentLines/DocumentLine[TaxCode=$id]/TaxTotal)"/>
			        </xsl:element>
                 </xsl:if>
                <xsl:if test="./tag[1]/id = ''">
                       
                    <xsl:element name="{./tag[1]/tag}">
				        <xsl:value-of select="sum($paramDocumentLines/DocumentLine[TaxCode=$id]/LineTotal)"/>
			        </xsl:element>
                 </xsl:if>
            </xsl:if>

		</xsl:for-each>
	

		
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
