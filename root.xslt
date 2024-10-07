<xsl:template name=""taxType"">
		        <xsl:param name=""taxCode""/>
		        <xsl:variable name=""taxs"">
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
		        <xsl:value-of select=""msxsl:node-set($taxs)/TaxCode/tax[id=$taxCode]/value""/>
	        </xsl:template>
