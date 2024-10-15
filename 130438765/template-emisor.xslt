<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template name="templateEmisor">
        <xsl:param name="paramRNCEmisor"/>
        <xsl:param name="paramRazonSocialEmisor"/>
        <xsl:param name="paramNombreComercial"/>
        <xsl:param name="paramSucursal"/>
        <xsl:param name="paramDireccionEmisor"/>
        <xsl:param name="paramMunicipio"/>
        <xsl:param name="paramProvincia"/>
        <xsl:param name="paramCorreoEmisor"/>
        <xsl:param name="paramWebSite"/>
        <xsl:param name="paramNumeroFacturaInterna"/>
        <xsl:param name="paramFechaEmision"/>
        
        <xsl:if test="$paramRNCEmisor"><RNCEmisor><xsl:value-of select="$paramRNCEmisor"/></RNCEmisor></xsl:if>
        <xsl:if test="$paramRazonSocialEmisor"><RazonSocialEmisor><xsl:value-of select="$paramRazonSocialEmisor"/></RazonSocialEmisor></xsl:if>
        <xsl:if test="$paramNombreComercial"><NombreComercial><xsl:value-of select="$paramNombreComercial"/></NombreComercial></xsl:if>
        <xsl:if test="$paramSucursal"><Sucursal><xsl:value-of select="$paramSucursal"/></Sucursal></xsl:if>
        <xsl:if test="$paramDireccionEmisor"><DireccionEmisor><xsl:value-of select="$paramDireccionEmisor"/></DireccionEmisor></xsl:if>
        <xsl:if test="$paramMunicipio"><Municipio><xsl:value-of select="$paramMunicipio"/></Municipio></xsl:if>
        <xsl:if test="$paramProvincia"><Provincia><xsl:value-of select="$paramProvincia"/></Provincia></xsl:if>
        <xsl:if test="$paramCorreoEmisor"><CorreoEmisor><xsl:value-of select="$paramCorreoEmisor"/></CorreoEmisor></xsl:if>
        <xsl:if test="$paramWebSite"><WebSite><xsl:value-of select="$paramWebSite"/></WebSite></xsl:if>
        <xsl:if test="$paramNumeroFacturaInterna"><NumeroFacturaInterna><xsl:value-of select="$paramNumeroFacturaInterna"/></NumeroFacturaInterna></xsl:if>
        <xsl:if test="$paramFechaEmision"><FechaEmision><xsl:value-of select="$paramFechaEmision"/></FechaEmision></xsl:if>
    </xsl:template>
</xsl:stylesheet>