<?xml version="1.0"  encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="/" name="templateDetallesItems">
		<xsl:variable name="indicadorFacturacions" select="/root/MappingTables/IndicadorFacturacions/IndicadorFacturacion"/>
		<xsl:variable name="documentLines" select="/root/Document/DocumentLines/DocumentLine"/>
		
		<xsl:for-each select="$documentLines">
			<xsl:variable name="itemTaxcode" select="TaxCode"/>
			<Item>
				<NumeroLinea>
					<xsl:value-of select="(LineNum) + 1"/>
				</NumeroLinea>
				<TablaCodigosItem>
					<CodigosItem>
						<!--validar campo TipoCodigo-->
						<TipoCodigo>INTERNA</TipoCodigo>
						<CodigoItem>
							<xsl:value-of select="ItemCode"/>
						</CodigoItem>
					</CodigosItem>
				</TablaCodigosItem>
				<IndicadorFacturacion>
					<!--validar proceso de mapeo de coaidos de impuesto-->
					<xsl:value-of select="$indicadorFacturacions[./Value=$itemTaxcode]/Code"/>
				</IndicadorFacturacion>
				<NombreItem>
					<xsl:value-of select="ItemDescription"/>
				</NombreItem>
				<IndicadorBienoServicio>2</IndicadorBienoServicio>
				<CantidadItem>
					<xsl:value-of select="Quantity"/>
				</CantidadItem>
				<PrecioUnitarioItem>
					<xsl:value-of select="LineTotal div Quantity"/>
				</PrecioUnitarioItem>
<!-- 				<OtraMonedaDetalle>
					<PrecioOtraMoneda>
						<xsl:value-of select="UnitPrice"/>
					</PrecioOtraMoneda>
					<MontoItemOtraMoneda>
						<xsl:value-of select="RowTotalFC"/>
					</MontoItemOtraMoneda>
				</OtraMonedaDetalle> -->
				<MontoItem>
					<xsl:value-of select="LineTotal"/>
				</MontoItem>
			</Item>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>