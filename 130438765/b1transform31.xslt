<?xml version="1.0"  encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:msxsl="urn:schemas-microsoft-com:xslt" version="1.0">

	<xsl:include href="https://raw.githubusercontent.com/henryceo/xslt-template/main/130438765/template-tax-code.xslt"/>
	<xsl:include href="130438765/template-tax-code.xslt"/>
	<xsl:include href="https://raw.githubusercontent.com/henryceo/xslt-template/main/130438765/template-tipo-ingreso.xslt"/>
	<!--<xsl:include href="130438765/template-currency.xslt"/>-->
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
					<TipoIngresos>01</TipoIngresos>
					<TipoPago>1</TipoPago>
					<xsl:if test="count($documentInstallments) &gt; 0">
						<TablaFormasPago>
							<xsl:for-each select="$documentInstallments">
								<FormaDePago>
									<!--validar FormaPago-->
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
					<!--validar datos emisor: de donde se tomaran estos datos faltante-->
					<RNCEmisor>130438765</RNCEmisor>
					<RazonSocialEmisor>CEO CONSULTORIA SRL</RazonSocialEmisor>
					<NombreComercial>CEO CONSULTORIA SRL</NombreComercial>
					<Sucursal>PRINCIPAL</Sucursal>
					<DireccionEmisor>Fantino Falco</DireccionEmisor>
					<Municipio>020100</Municipio>
					<Provincia>020000</Provincia>
					<CorreoEmisor>contabilidad@ceo.do</CorreoEmisor>
					<WebSite>www.ceo.do</WebSite>
					<!--validar datos emisor: de donde se tomaran estos datos faltante-->
					<NumeroFacturaInterna>
						<xsl:value-of select="$docNum"/>
					</NumeroFacturaInterna>
					<FechaEmision>
						<xsl:call-template name="formatFecha">
							<xsl:with-param name="fechaISO" select="$docDate"/>
						</xsl:call-template>
					</FechaEmision>
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
					<!--faltan los totales-->
					<MontoGravadoTotal>11987.04</MontoGravadoTotal>
					<MontoGravadoI1>11987.04</MontoGravadoI1>
					<MontoExento>27809.94</MontoExento>
					<!--aplicar logica de como tomar los valores clasrificado por tasa impositiva-->
					<ITBIS1>18</ITBIS1>
					<!--aplicar logica de como tomar los valores clasrificado por tasa impositiva-->
					<TotalITBIS>
						<xsl:value-of select="$root/VatSum"/>
					</TotalITBIS>
					<TotalITBIS1>
						<xsl:value-of select="$root/VatSum"/>
					</TotalITBIS1>
					<MontoTotal>
						<xsl:value-of select="$root/DocTotal"/>
					</MontoTotal>
				</Totales>
				<OtraMoneda>
						<!--validar los valores tomado del documento-->
						<TipoMoneda><xsl:value-of select="$root/DocCurrency"/></TipoMoneda>
						<TipoCambio><xsl:value-of select="$root/DocRate"/></TipoCambio>
						<MontoGravadoTotalOtraMoneda>200.00</MontoGravadoTotalOtraMoneda>
						<MontoGravado1OtraMoneda>200.00</MontoGravado1OtraMoneda>
						<MontoExentoOtraMoneda>464.00</MontoExentoOtraMoneda>
						<TotalITBISOtraMoneda><xsl:value-of select="$root/VatSumFc"/></TotalITBISOtraMoneda>
						<TotalITBIS1OtraMoneda><xsl:value-of select="$root/VatSumFc"/></TotalITBIS1OtraMoneda>
						<MontoTotalOtraMoneda><xsl:value-of select="$root/DocTotalFc"/></MontoTotalOtraMoneda>
						<!--validar los valores tomado del documento-->
					</OtraMoneda>
				<!--validar los valores tomado del documento-->
			</Encabezado>
			<DetallesItems>
				<xsl:for-each select="$root/DocumentLines/DocumentLine">
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
							<xsl:call-template name="taxType">
								<xsl:with-param name="taxCode" select="TaxCode"/>
							</xsl:call-template>
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
