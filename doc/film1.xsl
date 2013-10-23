<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version="1.0">
<xsl:output method="text" encoding="UTF-8"/>

<xsl:template match="/">
  <xsl:apply-templates select="//TITRE">
      <xsl:sort select="text()"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="TITRE">
  <xsl:value-of select="text()" />
<xsl:text>
</xsl:text>
</xsl:template>

</xsl:stylesheet>