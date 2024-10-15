<?xml version="1.0"  encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" version="1.0">
	
	<xsl:include href="template-tipo-ingreso.xslt"/>
	<xsl:include href="template-tipo-moneda.xslt"/>
	<xsl:include href="template-emisor.xslt"/>
	<xsl:include href="template-total.xslt"/>
	<xsl:include href="template-otra-moneda.xslt"/>
	<xsl:include href="template-otra-moneda.xslt"/>
	<xsl:include href="template-articulo.xslt"/>

	<!--<xsl:include href="mapeo-test.xml"/>
						<xsl:include href="https://raw.githubusercontent.com/henryceo/xslt-template/main/130438765/mapeo-test.xml"/>
						<xsl:include href="130438765/template-tax-code.xslt"/>
						<xsl:include href="130438765/template-currency.xslt"/>-->
	
	<!--<xsl:variable name="vpDoc1" select="msxsl:node-set($vrtfvpDoc1)"/>-->
	
	<xsl:param name="paramEmisorRNCEmisor"/>
	<xsl:param name="paramEmisorRazonSocialEmisor"/>
	<xsl:param name="paramEmisorNombreComercial"/>
	<xsl:param name="paramEmisorSucursal"/>
	<xsl:param name="paramEmisorDireccionEmisor"/>
	<xsl:param name="paramEmisorMunicipio"/>
	<xsl:param name="paramEmisorProvincia"/>
	<xsl:param name="paramEmisorCorreoEmisor"/>
	<xsl:param name="paramEmisorWebSite"/>
	
	<xsl:template match="/">
		<xsl:variable name="root" select="root"/>
		<xsl:variable name="tipoeCF" select="root/U_NCF"/>
		<xsl:variable name="ncfValidoHasta" select="root/U_NCF_ValidoHasta"/>
		<xsl:variable name="documentInstallments" select="root/DocumentInstallments/DocumentInstallment"/>
		<xsl:variable name="docNum" select="root/DocNum"/>
		<xsl:variable name="docDate" select="root/DocDate"/>
		<xsl:variable name="federalTaxID" select="root/FederalTaxID"/>
		<xsl:variable name="cardName" select="root/CardName"/>
		<xsl:variable name="address" select="root/Address"/>
		<xsl:variable name="cardCode" select="root/CardCode"/>
		<xsl:variable name="tipoIngreso" select="root/DocObjectCode"/>
		<xsl:variable name="impuestos" select="root/impuestos"/>
		<ECF>
			<Encabezado>
				<Version>1.0</Version>
				<IdDoc>
					<TipoeCF>
						<xsl:value-of select="substring($tipoeCF,2,2)"/>
					</TipoeCF>
					<eNCF>
						<xsl:value-of select="$tipoeCF"/>
					</eNCF>
					<FechaVencimientoSecuencia>
						<xsl:call-template name="formatFecha">
							<xsl:with-param name="fechaISO" select="$ncfValidoHasta"/>
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
						
						<xsl:with-param name="paramRNCEmisor" select="$paramEmisorRNCEmisor"/>
						<xsl:with-param name="paramRazonSocialEmisor" select="$paramEmisorRazonSocialEmisor"/>
						<xsl:with-param name="paramNombreComercial" select="$paramEmisorNombreComercial"/>
						<xsl:with-param name="paramSucursal" select="$paramEmisorSucursal"/>
						<xsl:with-param name="paramDireccionEmisor" select="$paramEmisorDireccionEmisor"/>
						<xsl:with-param name="paramMunicipio" select="$paramEmisorMunicipio"/>
						<xsl:with-param name="paramProvincia" select="$paramEmisorProvincia"/>
						<xsl:with-param name="paramCorreoEmisor" select="$paramEmisorCorreoEmisor"/>
						<xsl:with-param name="paramWebSite" select="$paramEmisorWebSite"/>
						<xsl:with-param name="paramNumeroFacturaInterna" select="$docNum"/>
						<xsl:with-param name="paramFechaEmision">
							<xsl:call-template name="formatFecha">
								<xsl:with-param name="fechaISO" select="$docDate"/>
							</xsl:call-template></xsl:with-param>
					</xsl:call-template>
				</Emisor>
				<Comprador>
					<RNCComprador>
						<xsl:value-of select="$federalTaxID"/>
					</RNCComprador>
					<RazonSocialComprador>
						<xsl:value-of select="$cardName"/>
					</RazonSocialComprador>
					<DireccionComprador>
						<xsl:value-of select="$address"/>
					</DireccionComprador>
					<CodigoInternoComprador>
						<xsl:value-of select="$cardCode"/>
					</CodigoInternoComprador>
				</Comprador>
				<!--validar los valores tomado del documento-->
				<Totales>
					<xsl:call-template name="templateTotal">
						<xsl:with-param name="paramDocumentLines" select="$root/DocumentLines"/>
						<xsl:with-param name="paramDocTotal" select="$root/DocTotal"/>
						<xsl:with-param name="paramVatSum" select="$root/VatSum"/>
					</xsl:call-template>
				</Totales>
				<OtraMoneda>
					<xsl:call-template name="templateOtraMoneda">
						<xsl:with-param name="paramDocumentLines" select="$root/DocumentLines"/>
						<xsl:with-param name="paramDocRate" select="$root/DocRate"/>
						<xsl:with-param name="paramDocCurrency">
							<xsl:call-template name="templateTipoMoneda">
								<xsl:with-param name="paramCode" select="$root/DocCurrency"/>
							</xsl:call-template>
						</xsl:with-param>
						<xsl:with-param name="paramVatSumFc" select="$root/VatSumFc"/>
						<xsl:with-param name="paramDocTotalFc" select="$root/DocTotalFc"/>
					</xsl:call-template>
				</OtraMoneda>
				<!--validar los valores tomado del documento-->
			</Encabezado>
			
			<xsl:call-template name="template-articulo" />
		</ECF>
	</xsl:template>
	<xsl:template name="formatFecha">
		<xsl:param name="fechaISO"/>
		<xsl:variable name="anio" select="substring($fechaISO, 1, 4)"/>
		<xsl:variable name="mes" select="substring($fechaISO, 6, 2)"/>
		<xsl:variable name="dia" select="substring($fechaISO, 9, 2)"/>
		<xsl:value-of select="concat($dia, '-', $mes, '-', $anio)"/>
	</xsl:template>
	<!-- templateTotal -->
	
	<xsl:template name="data">
	</xsl:template>
</xsl:stylesheet>
