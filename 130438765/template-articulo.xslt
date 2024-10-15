<?xml version="1.0"  encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="/" name="template-articulo">
		<xsl:variable name="impuestos" select="/root/impuestos"/>
		<xsl:variable name="articulos" select="/root/DocumentLines/DocumentLine"/>
		<DetallesItems>
		<xsl:copy-of select="/*"/>
			<xsl:for-each select="$articulos">
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
						<xsl:value-of select="$impuestos/impuesto[./id=$itemTaxcode]/value"/>
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
					<OtraMonedaDetalle>
						<PrecioOtraMoneda>
							<xsl:value-of select="UnitPrice"/>
						</PrecioOtraMoneda>
						<MontoItemOtraMoneda>
							<xsl:value-of select="RowTotalFC"/>
						</MontoItemOtraMoneda>
					</OtraMonedaDetalle>
					<MontoItem>
						<xsl:value-of select="LineTotal"/>
					</MontoItem>
				</Item>
			</xsl:for-each>
		</DetallesItems>
	</xsl:template>
</xsl:stylesheet>