<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template name="templateTipoIngreso">
		<xsl:param name="paramCode"/>
		
			<codes>
				<code>
					<id>oInvoices</id>
					<value>01</value>
				</code>
			</codes>
		
		<xsl:value-of select="codes/code[id=$paramCode]/value"/>
	</xsl:template>
	<!--    <xs:simpleType name="TipoIngresosValidationType">
    <xs:restriction base="xs:integer" >
      <xs:enumeration value="01"/> <!-- Ingresos por operaciones (No financieros) -->
      <!--<xs:enumeration value="02"/> <!-- Ingresos Financieros -->
      <!--<xs:enumeration value="03"/> <!-- Ingresos Extraordinarios -->
      <!--<xs:enumeration value="04"/> <!-- Ingresos por Arrendamientos -->
      <!--<xs:enumeration value="05"/> <!-- Ingresos por Venta de Activo Depreciable -->
      <!--<xs:enumeration value="06"/> <!-- Otros Ingresos -->
      <!--<xs:pattern value="[0]{1}[1-6]{1}"/>
    </xs:restriction>
  </xs:simpleType>-->
</xsl:stylesheet>


