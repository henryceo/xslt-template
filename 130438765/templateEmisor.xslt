<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/root/MappingTables" name="templateEmisor">
        <!--<xsl:variable name="rNCEmisor"/>
        <xsl:variable name="razonSocialEmisor"/>
        <xsl:variable name="nombreComercial"/>
        <xsl:variable name="sucursal"/>
        <xsl:variable name="direccionEmisor"/>
        <xsl:variable name="municipio"/>
        <xsl:variable name="provincia"/>
        <xsl:variable name="correoEmisor"/>
        <xsl:variable name="webSite"/>-->
        <xsl:param name="paramNumeroFacturaInterna"/>
        <xsl:param name="paramFechaEmision"/>
        <xsl:copy-of select="/*"/>
        <!--<xsl:if test="$rNCEmisor"><RNCEmisor><xsl:value-of select="$rNCEmisor"/></RNCEmisor></xsl:if>
        <xsl:if test="$razonSocialEmisor"><RazonSocialEmisor><xsl:value-of select="$razonSocialEmisor"/></RazonSocialEmisor></xsl:if>
        <xsl:if test="$nombreComercial"><NombreComercial><xsl:value-of select="$nombreComercial"/></NombreComercial></xsl:if>
        <xsl:if test="$sucursal"><Sucursal><xsl:value-of select="$sucursal"/></Sucursal></xsl:if>
        <xsl:if test="$direccionEmisor"><DireccionEmisor><xsl:value-of select="$direccionEmisor"/></DireccionEmisor></xsl:if>
        <xsl:if test="$municipio"><Municipio><xsl:value-of select="$municipio"/></Municipio></xsl:if>
        <xsl:if test="$provincia"><Provincia><xsl:value-of select="$provincia"/></Provincia></xsl:if>
        <xsl:if test="$correoEmisor"><CorreoEmisor><xsl:value-of select="$correoEmisor"/></CorreoEmisor></xsl:if>
        <xsl:if test="$webSite"><WebSite><xsl:value-of select="$webSite"/></WebSite></xsl:if>-->
        <xsl:if test="$paramNumeroFacturaInterna"><NumeroFacturaInterna><xsl:value-of select="$paramNumeroFacturaInterna"/></NumeroFacturaInterna></xsl:if>
        <xsl:if test="$paramFechaEmision"><FechaEmision><xsl:value-of select="$paramFechaEmision"/></FechaEmision></xsl:if>
    </xsl:template>
</xsl:stylesheet>