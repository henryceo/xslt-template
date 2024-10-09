<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template name="templateEmisor">
        <xsl:param name="paramDocNum"/>
        <xsl:param name="paramDocDate"/>
        <xsl:param name="paramSucursal"/>
        <!--validar datos emisor: de donde se tomaran estos datos faltante-->
        <RNCEmisor>130438765</RNCEmisor>
        <RazonSocialEmisor>CEO CONSULTORIA SRL</RazonSocialEmisor>
        <NombreComercial>CEO CONSULTORIA SRL</NombreComercial>
        <Sucursal><xsl:value-of select="$paramSucursal"/></Sucursal>
        <DireccionEmisor>Fantino Falco</DireccionEmisor>
        <Municipio>020100</Municipio>
        <Provincia>020000</Provincia>
        <CorreoEmisor>contabilidad@ceo.do</CorreoEmisor>
        <WebSite>www.ceo.do</WebSite>
        <!--validar datos emisor: de donde se tomaran estos datos faltante-->
        <NumeroFacturaInterna>
            <xsl:value-of select="$paramDocNum"/>
        </NumeroFacturaInterna>
        <FechaEmision>
            <xsl:value-of select="$paramDocDate"/>
        </FechaEmision>
    </xsl:template>
</xsl:stylesheet>