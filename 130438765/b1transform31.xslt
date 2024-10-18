<?xml version="1.0"  encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	
	<xsl:include href="template-tipo-ingreso.xslt"/>
	<xsl:include href="templateEmisor.xslt"/>
	<xsl:include href="templateTotales.xslt"/>
	<xsl:include href="templateOtraMoneda.xslt"/>
	<xsl:include href="templateDetallesItems.xslt"/>
	

	<xsl:include href="templateDetallesItems.xslt"/>
	<xsl:include href="templateDetallesItems.xslt"/>
	<xsl:include href="templateDetallesItems.xslt"/>
	<xsl:include href="templateDetallesItems.xslt"/>
	<xsl:include href="templateDetallesItems.xslt"/>
	<xsl:include href="templateDetallesItems.xslt"/>



	<xsl:template match="/">
		<xsl:variable name="document" select="root/Document"/>
		<xsl:variable name="tipoeCF" select="$document/U_NCF"/>
		<xsl:variable name="documentInstallments" select="$document/DocumentInstallments/DocumentInstallment"/>
		<xsl:variable name="tipoIngreso" select="$document/DocObjectCode"/>
		<ECF>
			<Encabezado>
				<Version>1.0</Version>
				<IdDoc>
					<TipoeCF><xsl:value-of select="substring($tipoeCF,2,2)"/></TipoeCF>
					<eNCF><xsl:value-of select="$tipoeCF"/></eNCF>
					<FechaVencimientoSecuencia>
						<xsl:call-template name="formatFecha">
							<xsl:with-param name="fechaISO" select="$document/U_NCF_ValidoHasta"/>
						</xsl:call-template>
					</FechaVencimientoSecuencia>
					<IndicadorMontoGravado>0</IndicadorMontoGravado>
					<TipoIngresos>	
						<xsl:call-template name="templateTipoIngreso">
							<xsl:with-param name="paramCode" select="$tipoIngreso"/>
						</xsl:call-template>
					</TipoIngresos>
					<!-- TODO -->
					<TipoPago>1</TipoPago>
					<!-- TODO -->
					<xsl:if test="count($documentInstallments) &gt; 0">
						<TablaFormasPago>
							<xsl:for-each select="$documentInstallments">
								<FormaDePago>
									<!-- TODO -->
									<FormaPago>4</FormaPago>
									<MontoPago>
										<xsl:value-of select="Total"/>
									</MontoPago>
								</FormaDePago>
							</xsl:for-each>
						</TablaFormasPago>
					</xsl:if>
				</IdDoc>
				<Emisor>
					<xsl:call-template name="templateEmisor">
						<xsl:with-param name="paramFechaEmision">
							<xsl:call-template name="formatFecha">
								<xsl:with-param name="fechaISO" select="$document/DocDate"/>
							</xsl:call-template>
						</xsl:with-param>
					</xsl:call-template>
				</Emisor>
				<Comprador>
					<RNCComprador><xsl:value-of select="$document/FederalTaxID"/></RNCComprador>
					<RazonSocialComprador><xsl:value-of select="$document/CardName"/></RazonSocialComprador>
					<DireccionComprador><xsl:value-of select="$document/Address"/></DireccionComprador>
					<CodigoInternoComprador><xsl:value-of select="$document/CardCode"/></CodigoInternoComprador>
				</Comprador>
				<!--validar los valores tomado del documento-->
				<Totales>
					<xsl:call-template name="templateTotales" />
				</Totales>
				<OtraMoneda>
					<xsl:call-template name="templateOtraMoneda"/>
				</OtraMoneda>
				<!--validar los valores tomado del documento-->
			</Encabezado>
			<DetallesItems>
				<xsl:call-template name="templateDetallesItems" />
			</DetallesItems>
		</ECF>
	</xsl:template>
	<xsl:template name="formatFecha">
		<xsl:param name="fechaISO"/>
		<xsl:variable name="anio" select="substring($fechaISO, 1, 4)"/>
		<xsl:variable name="mes" select="substring($fechaISO, 6, 2)"/>
		<xsl:variable name="dia" select="substring($fechaISO, 9, 2)"/>
		<xsl:value-of select="concat($dia, '-', $mes, '-', $anio)"/>
	</xsl:template>
</xsl:stylesheet>
